import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:test_flutter/flutterBlocStateMgmt/bloc_api_management/model/bloc_post_model.dart';


class PostRepository {

  Future<List<BlocPostModel>> fetchPost() async {
    try{
      final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));

      if(response.statusCode == 200){
        final body = jsonDecode(response.body.toString()) as List;
        return body.map((e){
          return BlocPostModel(
            postId: e["postId"],
            email: e["email"] as String,
            body: e["body"] as String
          );
        }).toList();
      }
    } on SocketException{
      throw Exception("Socket Exception!");
    } on TimeoutException{
      throw Exception("Timeout!");
    }

    throw Exception("Error while fetching data!");
  }

}