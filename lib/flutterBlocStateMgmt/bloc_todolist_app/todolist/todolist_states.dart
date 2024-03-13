import 'package:equatable/equatable.dart';

class TodoStates extends Equatable {

  final List<String> todosList;

  const TodoStates({
    this.todosList = const []
  });

  TodoStates copyWith({ List<String>? todosList}){
    return TodoStates(
      todosList: todosList ?? this.todosList
    );
  }

  @override
  List<Object> get props => [todosList];


}