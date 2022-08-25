import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:unit_and_widget_test_cats/repository/model/cat.dart';
import 'package:unit_and_widget_test_cats/repository/model/result_error.dart';

class CatService {
  final String baseUrl;
  final Client _httpClient;

  CatService({this.baseUrl = 'https://api.thecatapi.com/v1', http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<Cat> search() async {
    final response = await _httpClient.get(Uri.parse('$baseUrl/images/search?has_breeds=true'));
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        return Cat.fromJson(json.decode(response.body)[0]);
      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorSearchingCat();
    }
  }
}
