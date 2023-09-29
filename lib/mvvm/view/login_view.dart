import 'package:flutter/material.dart';
import 'package:test_flutter/mvvm/res/components/round_button.dart';
import 'package:test_flutter/mvvm/utils/routes/routes_name.dart';
import 'package:test_flutter/mvvm/utils/utils.dart';
import 'package:toast/toast.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height * 1;

    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: InputDecoration(
                hintText: "Email",
                labelText: "email",
                prefixIcon: Icon(Icons.alternate_email),
              ),
              onFieldSubmitted: (value){
                Utils.fieldFocusShift(context, emailFocusNode, passwordFocusNode);
              },
            ),

            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child){
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    obscuringCharacter: "*",
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "password",
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: InkWell(
                          onTap: (){
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: Icon(_obsecurePassword.value ? Icons.visibility_off : Icons.visibility),),
                    ),
                  );
                }),
            SizedBox(height: height * .070,),
            RoundButton(
              title: "Login",
              onPress: (){

                if(_emailController.text.isEmpty){
                  Utils.flushBarErrorMessages("Please enter email", context);
                } else if(_passwordController.text.isEmpty){
                  Utils.flushBarErrorMessages("Please enter password", context);
                }  else if(_passwordController.text.length < 6){
                  Utils.flushBarErrorMessages("Please enter valid password length (6 digits).", context);
                } else {

                }

              },
            ),
          ],
        ),
      ),
    );
  }
}
