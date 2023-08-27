import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/multirole_App/login_screen.dart';

class Teacher_Screen extends StatefulWidget {
  const Teacher_Screen({super.key});

  @override
  State<Teacher_Screen> createState() => _Teacher_ScreenState();
}

class _Teacher_ScreenState extends State<Teacher_Screen> {
  String email = '', age = '', role = '';

  @override
  void initState() {

    super.initState();
    loadData();
  }

  void loadData () async {
    SharedPreferences sprefs = await SharedPreferences.getInstance();
    email = sprefs.getString("username") ?? '';
    age = sprefs.getString("age") ?? '';
    role = sprefs.getString("role") ?? '';

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher Screen"),
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

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Wellcome $email!"),
                Text("Your age is $age"),
                Text("Your role is $role"),
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
