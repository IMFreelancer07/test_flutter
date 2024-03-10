import 'package:bloc/bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_counter_app/counter/bloc_counter_events.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_counter_app/counter/bloc_counter_states.dart';

class BlocCounterBloc extends Bloc<BlocCounterEvent, BlocCounterState>{
  BlocCounterBloc() : super(const BlocCounterState()){
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }

  void _increment(IncrementCounter event, Emitter<BlocCounterState> emit){
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrement(DecrementCounter event, Emitter<BlocCounterState> emit){
    emit(state.copyWith(counter: state.counter - 1));
  }
}