import 'package:bloc/bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_todolist_app/todolist/todolist_events.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_todolist_app/todolist/todolist_states.dart';

class TodoBloc extends Bloc<TodoEvents, TodoStates>{

  final List<String> todosList = [];

  TodoBloc():super(const TodoStates()){

    on<AddTodoEvents>(_addTodoEvent);
    on<RemoveTodoEvents>(_removeTodoEvent);
  }

  @override
  List<Object> get props => [];

  void _addTodoEvent(AddTodoEvents event, Emitter<TodoStates> emit){

    todosList.add(event.task);
    emit(state.copyWith(todosList: List.from(todosList)));
  }

  void _removeTodoEvent(RemoveTodoEvents event, Emitter<TodoStates> emit){

    todosList.remove(event.task);
    emit(state.copyWith(todosList: List.from(todosList)));
  }
}
