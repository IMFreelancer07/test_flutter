import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_res/components/socialMedia_input_text_field.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_res/components/socialMedia_round_button.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_utils/routes/socialMedia_route_name.dart';
import 'package:toast/toast.dart';

import '../../socialMedia_ViewModel/socialMedia_forgotPassword/socialMedia_forgotPassword.dart';

class socialMedia_forgotPasswordScreen extends StatefulWidget {
  const socialMedia_forgotPasswordScreen({super.key});

  @override
  State<socialMedia_forgotPasswordScreen> createState() => _socialMedia_forgotPasswordScreenState();
}

class _socialMedia_forgotPasswordScreenState extends State<socialMedia_forgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();


  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    emailFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    ToastContext().init(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
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
                  "Forgot Password",
                  style: Theme.of(context).textTheme.headline3,
                ),

                SizedBox(
                  height: height * .01,
                ),

                Text(
                  "Enter your email address\n to recover your password.",
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
                      ],
                    ),
                  ),
                ),

                SizedBox(height: height * 0.03,),

                ChangeNotifierProvider(
                  create: (_) => socialMedia_forgotPasswordController(),
                  child: Consumer<socialMedia_forgotPasswordController>(
                    builder: (context, provider, child){
                      return socialMedia_RoundButton(
                        title: "Submit",
                        isLoading: provider.loading,
                        onPress: () {
                          if(_formKey.currentState!.validate()){
                            provider.forgotPassword(context, emailController.text);
                          }
                        },
                      );
                    },
                  ),
                ),

                SizedBox(height: height * 0.03,),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
