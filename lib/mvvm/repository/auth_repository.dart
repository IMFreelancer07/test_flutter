
import 'package:test_flutter/mvvm/data/network/BaseApiServices.dart';
import 'package:test_flutter/mvvm/data/network/NetworkApiServices.dart';
import 'package:test_flutter/mvvm/res/app_urls.dart';

class AuthRepository {

  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {

    try {

      dynamic response = await _apiServices.getPostApiResponse(AppUrls.loginUrl, data);
      return response;

    } catch(e){
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {

    try {

      dynamic response = await _apiServices.getPostApiResponse(AppUrls.registerUserUrl, data);
      return response;

    } catch(e){
      throw e;
    }
  }
}