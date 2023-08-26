import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/multirole_App/login_screen.dart';

class MR_Home extends StatefulWidget {
  const MR_Home({super.key});

  @override
  State<MR_Home> createState() => _MR_HomeState();
}

class _MR_HomeState extends State<MR_Home> {

  String email = '', age = '';

  @override
  void initState() {

    super.initState();
    loadData();
  }

  void loadData () async {
    SharedPreferences sprefs = await SharedPreferences.getInstance();
    email = sprefs.getString("username") ?? '';
    age = sprefs.getInt("age")as String;

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Wellcome Home!"),
            SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Wellcome $email!"),
                Text("Your age is $age"),
              ],
            ),

            SizedBox(height: 30,),
            InkWell(
              onTap: () async{
                SharedPreferences sprefs = await SharedPreferences.getInstance();

                sprefs.clear();

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Login_Screen())
                );

              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.blueGrey,
                child: Center(
                  child: Text("Logout"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
