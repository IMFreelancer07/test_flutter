import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_counter_app/counter/bloc_counter_bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_counter_app/counter/bloc_counter_events.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_counter_app/counter/bloc_counter_states.dart';

class BlocCounterScreen extends StatefulWidget {
  const BlocCounterScreen({super.key});

  @override
  State<BlocCounterScreen> createState() => _BlocCounterScreenState();
}

class _BlocCounterScreenState extends State<BlocCounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Counter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<BlocCounterBloc, BlocCounterState>(builder: (context, state){
            return Center(child: Text(state.counter.toString(), style: TextStyle(fontSize: 30),),);
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                context.read<BlocCounterBloc>().add(IncrementCounter());
              }, child: const Text("Increment")),

              const SizedBox(width: 50,),

              ElevatedButton(onPressed: (){
                context.read<BlocCounterBloc>().add(DecrementCounter());
              }, child: const Text("Decrement"))
            ],
          )
        ],
      ),
    );
  }
}
