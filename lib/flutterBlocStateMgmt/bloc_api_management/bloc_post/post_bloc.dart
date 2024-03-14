import 'package:bloc/bloc.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_api_management/bloc_post/post_event.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_api_management/bloc_post/post_state.dart';
import 'package:test_flutter/flutterBlocStateMgmt/bloc_api_management/model/bloc_post_model.dart';
import 'package:test_flutter/flutterBlocStateMgmt/utils/enums.dart';
import '../repository/PostRepository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  List<BlocPostModel> templist = [];
  PostRepository repository = PostRepository();

  PostBloc() : super(PostState()) {
    on<PostFetch>(_postFetch);
    on<SearchPost>(_searchPost);
  }

  void _postFetch(PostFetch event, Emitter<PostState> emit) async {
    await repository.fetchPost().then((value) {
      emit(state.copyWith(
          status: PostStatus.Success, message: "Success", list: value));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          status: PostStatus.Failure, message: error.toString()));
    });
  }

  void _searchPost(SearchPost event, Emitter<PostState> emit) async {

    if(event.searchString.isEmpty){
      emit(state.copyWith(templist: [], searchMessage: ''));
    }else{
      templist = state.list
          .where((element) => element.email.toString().toLowerCase().contains(event.searchString.toString().toLowerCase()))
          .toList();

      if(templist.isEmpty){

        emit(state.copyWith(templist: templist, searchMessage: "No Data Found"));

      } else {

        emit(state.copyWith(templist: templist, searchMessage: ''));

      }
    }


  }
}
