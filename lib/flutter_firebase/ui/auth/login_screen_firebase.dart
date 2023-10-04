import 'package:flutter/material.dart';
import 'package:test_flutter/flutter_firebase/widgets/Round_Button.dart';

class LoginScreenFirebase extends StatefulWidget {
  const LoginScreenFirebase({super.key});

  @override
  State<LoginScreenFirebase> createState() => _LoginScreenFirebaseState();
}

class _LoginScreenFirebaseState extends State<LoginScreenFirebase> {

  final _formFieldKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Login"),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
              title: "Login",
              onTap: (){
                if(_formFieldKey.currentState!.validate()){

                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
