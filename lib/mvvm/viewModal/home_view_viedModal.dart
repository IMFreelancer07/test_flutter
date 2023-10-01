
import 'package:flutter/cupertino.dart';
import 'package:test_flutter/mvvm/data/response/api_response.dart';
import 'package:test_flutter/mvvm/modal/movies_list_modal.dart';
import 'package:test_flutter/mvvm/repository/home_repository.dart';

class Home_view_ViewModal with ChangeNotifier {

  final _myRepo = HomeRepository();

  ApiResponse<MoviesListModal> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MoviesListModal> response){
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetMoviesListApi () async {
    
    setMoviesList(ApiResponse.loading());

    _myRepo.moviesListApi().then((value){
      setMoviesList(ApiResponse.completed(value));

    }).onError((error, stackTrace){
      setMoviesList(ApiResponse.error(error.toString()));

    });
  }
}