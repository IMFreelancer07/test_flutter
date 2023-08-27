import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/multirole_App/multi_role_home.dart';
import 'package:test_flutter/multirole_App/student_screen.dart';
import 'package:test_flutter/multirole_App/teacher_screen.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {


  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  final roleController = TextEditingController();
  RoleLabel? selectedRole;

  @override
  Widget build(BuildContext context) {

    final List<DropdownMenuEntry<RoleLabel>> roleEntries =
    <DropdownMenuEntry<RoleLabel>>[];
    for (final RoleLabel role in RoleLabel.values) {
      roleEntries.add(
        DropdownMenuEntry<RoleLabel>(
            value: role, label: role.name, enabled: role != 'select role'),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email/ Username"
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "Password"
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Age"
              ),
            ),
            SizedBox(height: 30,),
            DropdownMenu<RoleLabel>(
              initialSelection: RoleLabel.admin,
              controller: roleController,
              label: const Text('role'),
              dropdownMenuEntries: roleEntries,
              onSelected: (RoleLabel? role) {
                setState(() {
                  selectedRole = role;
                });
              },
            ),

            SizedBox(height: 30,),

            InkWell(
              onTap: () async{
                SharedPreferences sprefs = await SharedPreferences.getInstance();

                sprefs.setString("username", emailController.text.toString());
                sprefs.setString("password", passwordController.text.toString());
                sprefs.setString("age", ageController.text.toString());
                sprefs.setString("role", "student");
                sprefs.setBool("isLoggedIn", true);

                if (sprefs.getString("role") == "student"){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Student_Screen())
                  );
                } else if(sprefs.getString("role") == "teacher") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Teacher_Screen())
                  );
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MR_Home())
                  );
                }

              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.blueGrey,
                child: Center(
                  child: Text("Sign Up"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum RoleLabel {
  admin,
  student,
  teacher
}