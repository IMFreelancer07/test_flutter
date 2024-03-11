import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_counter_app/counter_screen.dart';
import 'package:test_flutter/flutterBlocStateMgmt/switch_example/switch/switch_bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/switch_example/switch_screen.dart';

import '../mvvm/res/components/round_button.dart';
import 'bloc_counter_app/counter/bloc_counter_bloc.dart';

class BlocMain extends StatefulWidget {
  const BlocMain({super.key});

  @override
  State<BlocMain> createState() => _BlocMainState();
}

class _BlocMainState extends State<BlocMain> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BlocCounterBloc(),

        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
      ],
      child: const MaterialApp(
        home: BlocSwitchScreen(),
      ),
    );
  }
}
