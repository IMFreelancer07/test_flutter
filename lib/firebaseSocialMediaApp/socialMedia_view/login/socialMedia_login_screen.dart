import 'package:flutter/material.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_res/components/socialMedia_input_text_field.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_res/components/socialMedia_round_button.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_utils/routes/socialMedia_route_name.dart';

class socialMedia_loginScreen extends StatefulWidget {
  const socialMedia_loginScreen({super.key});

  @override
  State<socialMedia_loginScreen> createState() =>
      _socialMedia_loginScreenState();
}

class _socialMedia_loginScreenState extends State<socialMedia_loginScreen> {

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passworController = TextEditingController();
  final passworFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passworController.dispose();

    emailFocusNode.dispose();
    passworFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                SizedBox(
                  height: height * .01,
                ),

                Text(
                  "Wellcome",
                  style: Theme.of(context).textTheme.headline3,
                ),

                SizedBox(
                  height: height * .01,
                ),

                Text(
                  "Enter your email address\n to connect to your account",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1,
                ),

                SizedBox(
                  height: height * .01,
                ),

                Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.only(top: height * 0.06, bottom: height * 0.01),
                      child: Column(
                        children: [

                          socialMedia_inputFormField(
                              myController: emailController,
                              focusNode: emailFocusNode,
                              onFieldSubmittedValue: (value) {},
                              onValidator: (value) {
                                return value.isEmpty ? "Enter email" : null;
                              },
                              keyBoardType: TextInputType.emailAddress,
                              hint: "Email",
                              obscureText: false
                          ),

                          SizedBox(height: height * 0.01,),

                          socialMedia_inputFormField(
                              myController: passworController,
                              focusNode: passworFocusNode,
                              onFieldSubmittedValue: (value) {},
                              onValidator: (value) {
                                return value.isEmpty ? "Password" : null;
                              },
                              keyBoardType: TextInputType.text,
                              hint: "Password",
                              obscureText: true
                          ),
                        ],
                      ),
                    ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                      "Forgot password?",
                      style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 15, decoration: TextDecoration.underline)
                  ),
                ),

                SizedBox(height: height * 0.03,),

                socialMedia_RoundButton(
                  title: "Login",
                  onPress: () {},
                ),

                SizedBox(height: height * 0.03,),

                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, socialMedia_RouteName.singUp_View);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 15),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 15, decoration: TextDecoration.underline)
                        )
                      ]
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
