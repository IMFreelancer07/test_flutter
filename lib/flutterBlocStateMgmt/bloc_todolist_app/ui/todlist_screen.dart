import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_todolist_app/todolist/todolist_bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_todolist_app/todolist/todolist_events.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_todolist_app/todolist/todolist_states.dart';

class BlocTodolistScreen extends StatefulWidget {
  const BlocTodolistScreen({super.key});

  @override
  State<BlocTodolistScreen> createState() => _BlocTodolistScreenState();
}

class _BlocTodolistScreenState extends State<BlocTodolistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List Bloc App"),
      ),
      body: BlocBuilder<TodoBloc, TodoStates>(
        builder: (context, state) {
          if(state.todosList.isEmpty){
            return const Center(child: Text("No ToDos Found!"));
          } else if (state.todosList.isNotEmpty) {
            return ListView.builder(
                itemCount: state.todosList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.todosList[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        context.read<TodoBloc>().add(RemoveTodoEvents(task: state.todosList[index]));
                      },
                    ),
                  );
                });
          } else {
            return const SizedBox();
          }

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for(int i = 0; i< 10; i++){
            context.read<TodoBloc>().add(AddTodoEvents(task: 'Task # '+i.toString()));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
