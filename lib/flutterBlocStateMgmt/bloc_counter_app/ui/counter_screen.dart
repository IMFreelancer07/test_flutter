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
  late BlocCounterBloc _counterBloc;

  @override
  void initState() {

    _counterBloc = BlocCounterBloc();
    super.initState();
  }

  @override
  void dispose() {

    _counterBloc.close();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _counterBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bloc Counter App"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<BlocCounterBloc, BlocCounterState>(
                builder: (context, state) {
              return Center(
                child: Text(
                  state.counter.toString(),
                  style: TextStyle(fontSize: 30),
                ),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<BlocCounterBloc, BlocCounterState>(
                    buildWhen: (current, previous) => false,
                    builder: (context, state) {
                      return Center(
                        child: ElevatedButton(
                            onPressed: () {
                              context
                                  .read<BlocCounterBloc>()
                                  .add(IncrementCounter());
                            },
                            child: const Text("Increment")),
                      );
                    }),
                const SizedBox(
                  width: 50,
                ),
                BlocBuilder<BlocCounterBloc, BlocCounterState>(
                    buildWhen: (current, previous) => false,
                    builder: (context, state) {
                      return Center(
                          child: ElevatedButton(
                              onPressed: () {
                                context
                                    .read<BlocCounterBloc>()
                                    .add(DecrementCounter());
                              },
                              child: const Text("Decrement")));
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
