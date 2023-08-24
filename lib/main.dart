import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'components/my_Button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static const String id = "Main_Screen";

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text("FlutterCalculator"),
            backgroundColor: Colors.blueGrey,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            userInput.toString(),
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text(
                          answer.toString(),
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MyBtn(
                            "AC",
                            onPress: () {
                              userInput = "";
                              answer = "";
                              setState(() {});
                            },
                          ),
                          MyBtn("+/-", onPress: () {
                            userInput += '+/-';
                            setState(() {});
                          }),
                          MyBtn("%", onPress: () {
                            userInput += '%';
                            setState(() {});
                          }),
                          MyBtn("/", color: Color(0xffffa00a), onPress: () {
                            userInput += '/';
                            setState(() {});
                          }),
                        ],
                      ),
                      Row(
                        children: [
                          MyBtn(
                            "7",
                            onPress: () {
                              userInput += '7';
                              setState(() {});
                            },
                          ),
                          MyBtn("8", onPress: () {
                            userInput += '8';
                            setState(() {});
                          }),
                          MyBtn("9", onPress: () {
                            userInput += '9';
                            setState(() {});
                          }),
                          MyBtn("x", color: Color(0xffffa00a), onPress: () {
                            userInput += 'x';
                            setState(() {});
                          }),
                        ],
                      ),
                      Row(
                        children: [
                          MyBtn(
                            "4",
                            onPress: () {
                              userInput += '4';
                              setState(() {});
                            },
                          ),
                          MyBtn("5", onPress: () {
                            userInput += '5';
                            setState(() {});
                          }),
                          MyBtn("6", onPress: () {
                            userInput += '6';
                            setState(() {});
                          }),
                          MyBtn("-", color: Color(0xffffa00a), onPress: () {
                            userInput += '-';
                            setState(() {});
                          }),
                        ],
                      ),
                      Row(
                        children: [
                          MyBtn(
                            "1",
                            onPress: () {
                              userInput += '1';
                              setState(() {});
                            },
                          ),
                          MyBtn("2", onPress: () {
                            userInput += '2';
                            setState(() {});
                          }),
                          MyBtn("3", onPress: () {
                            userInput += '3';
                            setState(() {});
                          }),
                          MyBtn("+", color: Color(0xffffa00a), onPress: () {
                            userInput += '+';
                            setState(() {});
                          }),
                        ],
                      ),
                      Row(
                        children: [
                          MyBtn(
                            "0",
                            onPress: () {
                              userInput += '0';
                              setState(() {});
                            },
                          ),
                          MyBtn(".", onPress: () {
                            userInput += '.';
                            setState(() {});
                          }),
                          MyBtn("DEL", onPress: () {
                            userInput = userInput.substring(0, userInput.length-1);
                            setState(() {

                            });
                          }),
                          MyBtn("=", color: Color(0xffffa00a), onPress: () {
                            onEqual();
                            setState(() {

                            });
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onEqual(){

    String finalUserInput = userInput.replaceAll('x', "*");
    Parser prsr = Parser();
    Expression exp = prsr.parse(finalUserInput);
    ContextModel contxtModel = ContextModel();

    double evaluation = exp.evaluate(EvaluationType.REAL, contxtModel);
    answer = evaluation.toString();
  }
}

// Center(child: Text("Work in progress...!"))
