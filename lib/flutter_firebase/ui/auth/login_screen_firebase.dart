import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_flutter/flutter_firebase/ui/auth/login_with_phone_firebase.dart';
import 'package:test_flutter/flutter_firebase/ui/auth/signup_screen_firebase.dart';
import 'package:test_flutter/flutter_firebase/utils/utils_firebase.dart';
import 'package:test_flutter/flutter_firebase/widgets/Round_Button.dart';
import 'package:toast/toast.dart';

import '../../firebase_services/MainNavScreen.dart';
import '../postsFirebase/postsScreenFirebase.dart';

class LoginScreenFirebase extends StatefulWidget {
  const LoginScreenFirebase({super.key});

  @override
  State<LoginScreenFirebase> createState() => _LoginScreenFirebaseState();
}

class _LoginScreenFirebaseState extends State<LoginScreenFirebase> {

  final _formFieldKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool _loading = false;

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  void login(){

    setState(() {
      _loading = true;
    });

    _auth.signInWithEmailAndPassword(

        email: emailController.text.toString(),
        password: passwordController.text.toString()

    ).then((value) {

      setState(() {
        _loading = false;
      });

      UtilsFirebase().toastMessageFirebase(value.user!.email.toString(), true);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> MainNavScreenFirebase()));


    }).onError((error, stackTrace) {

      setState(() {
        _loading = false;
      });

      debugPrint(error.toString());
      UtilsFirebase().toastMessageFirebase(error.toString(), false);

    });
  }

  @override
  Widget build(BuildContext context) {

    ToastContext().init(context);

    return WillPopScope(
      onWillPop: ()async{

        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
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
                loading: _loading,
                onTap: (){
                  if(_formFieldKey.currentState!.validate()){
                    login();
                  }
                },
              ),

              SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have account?"),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context,
                           MaterialPageRoute(builder: (context)=> SignUpScreenFirebase())
                      );
                    },
                    child: Text("Signup"),),
                ],
              ),
              const SizedBox(height: 30,),

              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneLoginFirebase()));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.black
                    )
                  ),
                  child: Center(
                    child: Text("Login with phone number"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
