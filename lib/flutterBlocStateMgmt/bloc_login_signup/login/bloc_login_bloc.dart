import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'bloc_login_event.dart';

class Bloc_loginBloc extends Bloc<Bloc_loginEvent, Bloc_loginState> {
  Bloc_loginBloc() : super(Bloc_loginState()){
    on<Bloc_LoginEvent>((event, emit)){

    }
  }

}