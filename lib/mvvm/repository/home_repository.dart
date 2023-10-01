
import 'package:test_flutter/mvvm/data/network/BaseApiServices.dart';
import 'package:test_flutter/mvvm/data/network/NetworkApiServices.dart';
import 'package:test_flutter/mvvm/modal/movies_list_modal.dart';

import '../res/app_urls.dart';

class HomeRepository {

  BaseApiServices _apiServices = NetworkApiServices();

  Future<MoviesListModal> moviesListApi() async {

    try {

      dynamic response = await _apiServices.getGetApiResponse(AppUrls.moviesListUrl);
      return response = MoviesListModal.fromJson(response);

    } catch(e){
      throw e;
    }
  }
}