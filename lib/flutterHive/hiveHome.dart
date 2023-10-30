import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class hiveHome extends StatefulWidget {
  const hiveHome({super.key});

  @override
  State<hiveHome> createState() => _hiveHomeState();
}

class _hiveHomeState extends State<hiveHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive Home"),
      ),
      body: Column(
        children: [
          FutureBuilder(future: Hive.openBox("hiveFile"),
              builder: (context, snapshot){
                var files = Hive.box("hiveFile");
                return Text(files.get("details").toString());
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{

          var box = await Hive.openBox("hiveFile");

          box.put("key", "value");
          box.put("details", {
          });
          setState(() {

          });
        },
        child: Icon(Icons.chat_bubble),
      ),
    );
  }
}
