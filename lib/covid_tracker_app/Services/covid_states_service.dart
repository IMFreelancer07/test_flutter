import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_flutter/covid_tracker_app/Services/utilities/covid_AppUrls.dart';

import '../Model/WorldStatesModel.dart';

class CovidStateServices {

  Future<WorldStatesModel> fetchWorldStatesRecords () async {
    final response = await http.get(Uri.parse(covid_AppUrls.worldStatesApi));

    if(response.statusCode == 200 ) {
      var data = jsonDecode(response.body);

      return WorldStatesModel.fromJson(data);
    }else{
      throw Exception("Error fetching data!");
    }

  }

  Future<List<dynamic>> fetchCountriesRecords () async {
    final response = await http.get(Uri.parse(covid_AppUrls.countriesList));
    var data;

    if(response.statusCode == 200 ) {
      data = jsonDecode(response.body);

      return data;
    }else{
      throw Exception("Error fetching data!");
    }

  }
}