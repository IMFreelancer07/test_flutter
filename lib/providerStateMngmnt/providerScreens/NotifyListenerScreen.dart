import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});

  ValueNotifier<int> _count = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateless as Stateful"),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context, value, child){
               return  TextFormField(
                 obscureText: toggle.value,
                 decoration: InputDecoration(
                     hintText: "Password",
                     suffix: InkWell(
                         onTap: (){
                           toggle.value = !toggle.value;
                         },
                         child: Icon(toggle.value ? Icons.visibility : Icons.visibility_off)
                     )
                 ),
               );
              }
          ),
          Center(
            child:
            ValueListenableBuilder(
              valueListenable: _count,
              builder: (context, value, child){
                return Text(_count.value.toString(), style: TextStyle(fontSize: 50),);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _count.value++;
          print(_count.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
