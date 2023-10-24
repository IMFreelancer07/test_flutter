import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_ViewModel/socialMedia_signup/socialMedia_signup_controller.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_utils/routes/socialMedia_route_name.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_utils/socialMedia_utils.dart';
import 'package:toast/toast.dart';

import '../../socialMedia_res/components/socialMedia_input_text_field.dart';
import '../../socialMedia_res/components/socialMedia_round_button.dart';

class socialMedia_Signup_View extends StatefulWidget {
  const socialMedia_Signup_View({super.key});

  @override
  State<socialMedia_Signup_View> createState() => _socialMedia_Signup_ViewState();
}

class _socialMedia_Signup_ViewState extends State<socialMedia_Signup_View> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final userNameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    userNameFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {

    ToastContext().init(context);
    final height = MediaQuery.of(context).size.height * 1;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ChangeNotifierProvider(
            create: (_) => socialMedia_singUpController(),
            child: Consumer<socialMedia_singUpController>(
              builder: (context, provider, child){
                return SingleChildScrollView(
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
                        "Enter your email address\n to signup for your account",
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
                                  myController: userNameController,
                                  focusNode: userNameFocusNode,
                                  onFieldSubmittedValue: (value) {
                                    socialMedia_utils.fiedlFocus_socialMedia(context, userNameFocusNode, emailFocusNode);
                                  },
                                  onValidator: (value) {
                                    return value.isEmpty ? "Enter username" : null;
                                  },
                                  keyBoardType: TextInputType.emailAddress,
                                  hint: "Username",
                                  obscureText: false
                              ),

                              SizedBox(height: height * 0.01,),

                              socialMedia_inputFormField(
                                  myController: emailController,
                                  focusNode: emailFocusNode,
                                  onFieldSubmittedValue: (value) {
                                    socialMedia_utils.fiedlFocus_socialMedia(context, emailFocusNode, passwordFocusNode);
                                  },
                                  onValidator: (value) {
                                    return value.isEmpty ? "Enter email" : null;
                                  },
                                  keyBoardType: TextInputType.emailAddress,
                                  hint: "Email",
                                  obscureText: false
                              ),

                              SizedBox(height: height * 0.01,),

                              socialMedia_inputFormField(
                                  myController: passwordController,
                                  focusNode: passwordFocusNode,
                                  onFieldSubmittedValue: (value) {
                                  },
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

                      SizedBox(height: height * 0.03,),

                      socialMedia_RoundButton(
                        title: "Signup",
                        isLoading: provider.loading,
                        onPress: () {
                          if(_formKey.currentState!.validate()){
                            provider.signup(context, userNameController.text, emailController.text, passwordController.text);
                          }
                        },
                      ),

                      SizedBox(height: height * 0.03,),

                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, socialMedia_RouteName.loginView);
                        },
                        child: Text.rich(
                          TextSpan(
                              text: "Already have an account? ",
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 15),
                              children: [
                                TextSpan(
                                    text: "Login",
                                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 15, decoration: TextDecoration.underline)
                                )
                              ]
                          ),
                        ),
                      ),

                    ],
                  ),
                );
              },
            ),
          )
        ),
      ),
    );
  }
}
