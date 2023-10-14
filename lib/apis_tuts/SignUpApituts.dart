import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:test_flutter/flutter_firebase/utils/utils_firebase.dart';
import 'package:test_flutter/mvvm/utils/utils.dart';
import 'package:toast/toast.dart';

class SignUp_ApiTuts extends StatefulWidget {
  const SignUp_ApiTuts({super.key});

  @override
  State<SignUp_ApiTuts> createState() => _SignUp_ApiTutsState();
}

class _SignUp_ApiTutsState extends State<SignUp_ApiTuts> {

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, password) async {
    try{
      Response response = await post(
        /**Uri.parse("https://reqres.in/api/login"),
        login api
         **/
        Uri.parse("https://reqres.in/api/register"),
        body: {
          "email" : email,
          "password" : password,
        }
      );

      if (response.statusCode == 200 ){
        print("Account created successfully!");
        UtilsFirebase().toastMessageFirebase("Account created successfully!", true);
      } else {
        print("Failed! Try again");
        UtilsFirebase().toastMessageFirebase("Failed! Try again", false);
      }
    }catch (e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {

    ToastContext().init(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SignUp"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: userNameController,
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
            GestureDetector(
              onTap: (){
                login(userNameController.text.toString(), passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
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
