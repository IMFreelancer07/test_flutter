import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/switch_example/switch/switch_event.dart';
import 'package:test_flutter/flutterBlocStateMgmt/switch_example/switch/switch_states.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates> {

  SwitchBloc():super(SwitchStates()) {
    on<EnableOrDisableNotifications>(_enableOrDisableNotifications);
    on<SliderEvent>(_sliderEvent);
  }

  void  _enableOrDisableNotifications(EnableOrDisableNotifications events, Emitter<SwitchStates> emit){

    emit(state.copyWith(switchValue: !state.switchValue));
  }

  void _sliderEvent(SliderEvent event, Emitter<SwitchStates> emit){

    emit(state.copyWith(sliderValue: event.sliderValue));
  }

}