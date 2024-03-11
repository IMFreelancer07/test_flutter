import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/switch_example/switch/switch_bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/switch_example/switch/switch_event.dart';
import 'package:test_flutter/flutterBlocStateMgmt/switch_example/switch/switch_states.dart';

class BlocSwitchScreen extends StatefulWidget {
  const BlocSwitchScreen({super.key});

  @override
  State<BlocSwitchScreen> createState() => _BlocSwitchScreenState();
}

class _BlocSwitchScreenState extends State<BlocSwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notification"),

                BlocBuilder<SwitchBloc, SwitchStates>(
                    buildWhen: (previous, current) => previous.switchValue != current.switchValue,
                    builder: (context, state) {
                      print("Building Switch...");
                  return Switch(value: state.switchValue, onChanged: (newValue){
                    context.read<SwitchBloc>().add(EnableOrDisableNotifications());
                  });
                })
              ],
            ),

            const SizedBox(height: 30,),

            BlocBuilder<SwitchBloc, SwitchStates>(
                buildWhen: (previous, current) => previous.sliderValue != current.sliderValue,
                builder: (context, state){
                  print("Building Slidder...");
              return Container(
                height: 200,
                color: Colors.blueGrey.withOpacity(state.sliderValue),
              );
            }),

            const SizedBox(height: 30,),


            BlocBuilder<SwitchBloc, SwitchStates>(builder: (context, state){
              print("Building Slider...");
              return  Slider(value: state.sliderValue, onChanged: (value){
                context.read<SwitchBloc>().add(SliderEvent(sliderValue: value));
              });
            })



          ],
        ),
      ),
    );
  }
}
