import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/flutter_firebase/ui/auth/login_screen_firebase.dart';
import 'package:test_flutter/flutter_firebase/utils/utils_firebase.dart';
import 'package:test_flutter/flutter_firebase/widgets/Round_Button.dart';
import 'package:toast/toast.dart';

class SignUpScreenFirebase extends StatefulWidget {
  const SignUpScreenFirebase({super.key});

  @override
  State<SignUpScreenFirebase> createState() => _SignUpScreenFirebaseState();
}

class _SignUpScreenFirebaseState extends State<SignUpScreenFirebase> {

  final _formFieldKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool loading = false;

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  login(){
    if(_formFieldKey.currentState!.validate()){

      setState(() {
        loading = true;
      });

      _auth.createUserWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString()).then((value){
        setState(() {
          loading = false;
        });
      }).onError((error, stackTrace){
        UtilsFirebase().toastMessageFirebase(error.toString());
        setState(() {
          loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    ToastContext().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Sign Up"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            Form(
              key: _formFieldKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        hintText: "Email",
                        helperText: "Enter email e.g: user@gmail.com",
                        prefixIcon: Icon(Icons.alternate_email)
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter Email";
                      } else if(!value.contains("@") && !value.contains( ".com")) {
                        return "Enter valid email address";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 15,),

                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Password",
                        helperText: "Enter password consisting of atleast 8 digits",
                        prefixIcon: Icon(Icons.lock_outline)
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter Password";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 35,),

            RoundButtonFirebase(
              title: "Sign Up",
              loading: loading,
              onTap: (){
                login();
              },
            ),

            SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have account?"),
                TextButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> LoginScreenFirebase())
                    );
                  },
                  child: Text("Login now"),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
