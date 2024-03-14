import 'package:bloc/bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_api_management/bloc_post/post_event.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_api_management/bloc_post/post_state.dart';
import 'package:test_flutter/flutterBlocStateMgmt/utils/enums.dart';
import '../repository/PostRepository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {

  PostRepository repository = PostRepository();
  PostBloc():super(PostState()){
    on<PostFetch>(_postFetch);
  }

  void _postFetch(PostFetch event, Emitter<PostState> emit) async{

    await repository.fetchPost().then((value){
      emit(state.copyWith(
          status: PostStatus.Success,
          message: "Success",
          list: value
      ));
    }).onError((error, stackTrace){
      emit(state.copyWith(status: PostStatus.Failure, message: error.toString()));
    });
  }
}