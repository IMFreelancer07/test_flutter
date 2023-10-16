import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/flutter_firebase/utils/utils_firebase.dart';
import 'package:test_flutter/flutter_firebase/widgets/Round_Button.dart';

class forgotPasswordFirebase extends StatefulWidget {
  const forgotPasswordFirebase({super.key});

  @override
  State<forgotPasswordFirebase> createState() => _forgotPasswordFirebaseState();
}

class _forgotPasswordFirebaseState extends State<forgotPasswordFirebase> {

  final emailController = TextEditingController();
  final firebaseAuth = FirebaseAuth.instance;
  bool spinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email"
              ),
            ),
            SizedBox(height: 40,),
            RoundButtonFirebase(
                title: "Submit",
                loading: spinner,
                onTap: (){

                  setState(() {
                    spinner = true;
                  });

                  firebaseAuth.sendPasswordResetEmail(
                      email: emailController.text.toString(),
                  ).then((value) {
                    setState(() {
                      spinner = false;
                    });
                    UtilsFirebase().toastMessageFirebase("A password recovery email has been sent to your email address."
                                                          " Please check your email!", true);
                  }).onError((error, stackTrace){
                    setState(() {
                      spinner = false;
                    });
                    UtilsFirebase().toastMessageFirebase("Error: $error", false);
                  });
                }
            ),
          ],
        ),
      ),
    );
  }
}
