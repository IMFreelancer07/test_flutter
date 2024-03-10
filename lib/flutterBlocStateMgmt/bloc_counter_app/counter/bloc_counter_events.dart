import 'package:equatable/equatable.dart';

abstract class BlocCounterEvent extends Equatable {

  const BlocCounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementCounter extends BlocCounterEvent {

}

class DecrementCounter extends BlocCounterEvent {

}