import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../login/bloc_login_bloc.dart';

class BlocLoginScreen extends StatefulWidget {
  const BlocLoginScreen({super.key});

  @override
  State<BlocLoginScreen> createState() => _BlocLoginScreenState();
}

class _BlocLoginScreenState extends State<BlocLoginScreen> {

  late LoginBloc _loginBloc;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    _loginBloc = LoginBloc();
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
              BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (current, previous) =>
                  current.email != previous.email,
                  builder: (context, state) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      focusNode: emailFocusNode,
                      decoration: const InputDecoration(
                          hintText: "Email", border: OutlineInputBorder()),
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                            EmailChanged(email: value));
                      },
                      onFieldSubmitted: (value) {},
                    );
                  }),
              const SizedBox(height: 20,),

              BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (current, previous) =>
                  current.password != previous.password,
                  builder: (context, state) {
                    return TextFormField(
                      keyboardType: TextInputType.text,
                      focusNode: passwordFocusNode,
                      decoration: const InputDecoration(
                          hintText: "Password", border: OutlineInputBorder()),
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                            PasswordChanged(password: value));
                      },
                      onFieldSubmitted: (value) {},
                    );
                  }),
              const SizedBox(height: 20,),

              BlocListener<LoginBloc, LoginState>(
                listener: (context, state){
                  if(state.loginStatus == LoginStatus.error){
                    ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                            SnackBar(content: Text(state.message.toString())),
                        );
                  }

                  if(state.loginStatus == LoginStatus.loading){
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(content: Text("Loading...")),
                      );
                  }

                  if(state.loginStatus == LoginStatus.success){
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                         const SnackBar(content: Text("Login in success!")),
                      );
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (current, previous) => false,
                    builder: (context, state) {
                      return ElevatedButton(onPressed: () {
                        context.read<LoginBloc>().add(LoginApi());
                      }, child: const Text("Login"));
                    }),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
