

import 'package:equatable/equatable.dart';

class BlocCounterState extends Equatable {

  final int counter;

  const BlocCounterState({
    this.counter = 0
  });

  BlocCounterState copyWith ({int? counter}){
    return BlocCounterState(
      counter: counter ?? this.counter
    );
}

  @override
  List<Object?> get props => [counter];

}