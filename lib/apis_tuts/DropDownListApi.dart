import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'DropDownModal.dart';

class DropDownApiScreen extends StatefulWidget {
  const DropDownApiScreen({super.key});

  @override
  State<DropDownApiScreen> createState() => _DropDownApiScreenState();
}

class _DropDownApiScreenState extends State<DropDownApiScreen> {

  Future<List<DropDownModal>> getPost () async {

    try {

      final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      final body = jsonDecode(response.body.toString()) as List;

      if(response.statusCode == 200) {
        return body.map((e) {
          final map = e as Map<String, dynamic>;
          return DropDownModal(
            userId: map['userId'],
            id: map['id'],
            title: map['title'],
            body: map['body']
          );
        }).toList();
      } else {}

    } on SocketException{
      throw Exception("No Internet, please check!");
    }

    throw Exception("Error fetching data...");

  }

  var selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("DropDown ApiDataload"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<List<DropDownModal>>(
                future: getPost(),
                builder: (context, AsyncSnapshot snapshot){

                  if(!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                   return DropdownButton(
                       hint: Text("Select value"),
                       items: snapshot.data!.map((e){
                         return DropdownMenuItem(
                             value: e.id.toString(),
                             child: Text(e.id.toString()),
                         );
                       }),
                       onChanged: (value) {
                         selectedValue = value;
                         setState(() {

                         });
                       }
                   );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
