import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'bloc_login_event.dart';
part 'bloc_login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState >{
  LoginBloc() : super(const LoginState()){
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_onLoginApi);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        email: event.email,
      )
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(
        state.copyWith(
          password: event.password,
        )
    );
  }

  void _onLoginApi(LoginApi event, Emitter<LoginState> emit) async {

    Map data = {'email': state.email, 'password': state.password};

    emit(
        state.copyWith(
          loginStatus: LoginStatus.loading,
        )
    );

    try {

      final response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: data
      );

      var res = jsonDecode(response.body);

      if(response.statusCode == 200){
        emit(
            state.copyWith(
              loginStatus: LoginStatus.success,
              message: "Login Success!",
            )
        );
      } else {
        emit(
            state.copyWith(
              loginStatus: LoginStatus.error,
              message: res['error'],
            )
        );
      }
    } catch (e) {
      emit(
          state.copyWith(
            loginStatus: LoginStatus.error,
            message: e.toString(),
          )
      );
    }
  }

}