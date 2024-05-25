import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_login_signup/login/bloc_login_bloc.dart';

import '../login/bloc_login_state.dart';

class BlocLoginScreen extends StatefulWidget {
  const BlocLoginScreen({super.key});

  @override
  State<BlocLoginScreen> createState() => _BlocLoginScreenState();
}

class _BlocLoginScreenState extends State<BlocLoginScreen> {

  late Bloc_loginBloc _loginBloc;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {

    _loginBloc = Bloc_loginBloc();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Login Screen"),
      ),
      body: BlocProvider(
        create: (_) => _loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<Bloc_loginBloc, Bloc_loginState>(builder: (context, state){
                return TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  focusNode: emailFocusNode,
                  decoration: const InputDecoration(hintText: "Email", border: OutlineInputBorder()),
                  onChanged: (value){},
                  onFieldSubmitted: (value){},
                );
              }),
              const SizedBox(height: 20,),

              BlocBuilder<Bloc_loginBloc, Bloc_loginState>(builder: (context, state){
                return TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  focusNode: passwordFocusNode,
                  decoration: const InputDecoration(hintText: "Password", border: OutlineInputBorder()),
                  onChanged: (value){},
                  onFieldSubmitted: (value){},
                );
              }),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: (){}, child: const Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
