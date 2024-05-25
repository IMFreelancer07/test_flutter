part of 'bloc_login_bloc.dart';

enum LoginStatus {initial, loading, success, error}

class Bloc_loginState extends Equatable {

  const Bloc_loginState({
    this.email = '',
    this.password = '',
    this.message = '',
    this.loginStatus = LoginStatus.initial
  });

  final String email;
  final String password;
  final String message;
  final LoginStatus loginStatus;

  Bloc_loginState copyWith({
    String? email,
    String? password,
    String? message,
    LoginStatus? loginStatus,
}) {
    return Bloc_loginState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }


}