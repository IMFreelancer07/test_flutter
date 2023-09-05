import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class complexUserDataApi extends StatefulWidget {
  const complexUserDataApi({super.key});

  @override
  State<complexUserDataApi> createState() => _complexUserDataApiState();
}

class _complexUserDataApiState extends State<complexUserDataApi> {
  var data;
  Future<void> getUserApi () async {

    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if(response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ComplexJson"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getUserApi(),
                  builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                 return Text("Loading...");
                } else {
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                reusableRow("Name :", data[index]['name'].toString(),),
                                reusableRow("UserName :", data[index]['username'].toString(),),
                                reusableRow("Address :",
                                  data[index]['address']["city"].toString()+ " "+
                                  data[index]['address']["zipcode"].toString(),),
                                reusableRow("Company :",
                                  data[index]['company']["name"].toString(),),
                              ],
                            ),
                          ),
                        );
                      });
                }
              })
          )
        ],
      ),
    );
  }
}

class reusableRow extends StatelessWidget {
  String title, value;
  reusableRow(this.title, this.value,{super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}