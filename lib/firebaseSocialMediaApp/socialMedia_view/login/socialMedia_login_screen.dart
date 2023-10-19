import 'package:flutter/material.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_res/components/socialMedia_input_text_field.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_res/components/socialMedia_round_button.dart';

class socialMedia_loginScreen extends StatefulWidget {
  const socialMedia_loginScreen({super.key});

  @override
  State<socialMedia_loginScreen> createState() => _socialMedia_loginScreenState();
}

class _socialMedia_loginScreenState extends State<socialMedia_loginScreen> {

  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            socialMedia_inputFormField(
                myController: emailController,
                focusNode: emailFocusNode,
                onFieldSubmittedValue: (value){},
                onValidator: (value){
                  return value.isEmpty ? "Enter email" : null;
                },
                keyBoardType: TextInputType.emailAddress,
                hint: "Email",
                obscureText: false
            ),
            SizedBox(height: 40,),
            socialMedia_RoundButton(
                title: "Login",
                onPress: (){},
            )
          ],
        ),
      ),
    );
  }
}
