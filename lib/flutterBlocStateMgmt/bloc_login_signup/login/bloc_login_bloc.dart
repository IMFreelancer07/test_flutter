import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bloc_login_event.dart';
part 'bloc_login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState >{
  LoginBloc() : super(LoginState()){
    on<LoginEvent>((event, emit)){

    }
  }

}