import 'package:equatable/equatable.dart';
import 'package:test_flutter/flutterBlocStateMgmt/utils/enums.dart';
import '../model/bloc_post_model.dart';

class PostState extends Equatable {

  final PostStatus status;
  final List<BlocPostModel> list ;
  final List<BlocPostModel> templist ;
  final String message;
  final String searchMessage;

  PostState({
    this.status = PostStatus.Loading,
    this.list =  const <BlocPostModel>[],
    this.templist =  const <BlocPostModel>[],
    this.message = '',
    this.searchMessage = ''
});

  PostState copyWith({PostStatus? status, List<BlocPostModel>? list, String? message, String? searchMessage, List<BlocPostModel>? templist}){
    return PostState(
      status: status ?? this.status,
      list: list ?? this.list,
      templist: templist ?? this.templist,
      message: message ?? this.message,
      searchMessage: searchMessage ?? this.searchMessage,
    );
}

  @override
  List<Object> get props => [status, list, message, templist, searchMessage];
}
