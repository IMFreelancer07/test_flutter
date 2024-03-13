import 'package:equatable/equatable.dart';

abstract class TodoEvents extends Equatable {

  const TodoEvents();
}

class AddTodoEvents extends TodoEvents {

  final String task;

  AddTodoEvents({
    required this.task
});

  @override
  List<Object> get props => [task];
}

class RemoveTodoEvents extends TodoEvents {

  final Object task;

  const RemoveTodoEvents({required this.task});

  @override
  List<Object> get props => [task];
}
