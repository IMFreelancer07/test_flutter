import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Equatable_Testing extends StatefulWidget {
  const Equatable_Testing({super.key});

  @override
  State<Equatable_Testing> createState() => _Equatable_TestingState();
}

class _Equatable_TestingState extends State<Equatable_Testing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Person p1 = Person(age: 25, name: "Person1");
          Person p2 = Person(age: 27, name: "Person2");
        },
      ),
    );
  }
}


class Person extends Equatable{

  final String name;
  final int age;

  const Person({required this.age, required this.name});

  @override
  List<Object?> get props => [age, name];
}