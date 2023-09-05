import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Modals/UserModal.dart';

class userDataApi extends StatefulWidget {
  const userDataApi({super.key});

  @override
  State<userDataApi> createState() => _userDataApiState();
}

class _userDataApiState extends State<userDataApi> {
  List<UserModal> userList = [];

  Future<List<UserModal>> getUserApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModal.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("userData"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUserApi(),
                builder: (context, AsyncSnapshot<List<UserModal>> snapshot) {
                  if(!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }else {
                    return ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  reusableRow("Name :", snapshot.data![index].name.toString()),
                                  reusableRow("Username :", snapshot.data![index].username.toString()),
                                  reusableRow("Email :", snapshot.data![index].email.toString()),
                                  reusableRow("Address :",
                                      snapshot.data![index].address!.city.toString() + " " + snapshot.data![index].address!.zipcode.toString()
                                  ),
                                  reusableRow("Company :", snapshot.data![index].company!.name.toString()),

                                ],
                              ),
                            ),
                          );
                        });
                  }
                }),
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

