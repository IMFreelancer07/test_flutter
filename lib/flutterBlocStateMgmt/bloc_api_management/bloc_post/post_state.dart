import 'package:equatable/equatable.dart';
import 'package:test_flutter/flutterBlocStateMgmt/utils/enums.dart';
import '../model/bloc_post_model.dart';

class PostState extends Equatable {

  final PostStatus status;
  final List<BlocPostModel> list ;
  final String message;

  PostState({
    this.status = PostStatus.Loading,
    this.list =  const <BlocPostModel>[],
    this.message = ''
});

  PostState copyWith({PostStatus? status, List<BlocPostModel>? list, String? message}){
    return PostState(
      status: status ?? this.status,
      list: list ?? this.list,
      message: message ?? this.message
    );
}

  @override
  List<Object> get props => [status, list, message];
}
