part of 'bloc_login_bloc.dart';


abstract class Bloc_loginEvent extends Equatable {
  const Bloc_loginEvent();

  @override
  List<Object> get props => [];

}

class EmailChanged extends Bloc_loginEvent {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends Bloc_loginEvent {
  const PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class Bloc_loginApi extends Bloc_loginEvent {}

