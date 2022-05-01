import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_serializable_app/model/person_model.dart';

const String randomPersonURL = "https://randomuser.me/api";

class PersonNetworkService {
  Future<List<PersonModel>> fetchPersons(int amount) async {
    http.Response response = await http.get(Uri.parse("$randomPersonURL?results=$amount"));

    if (response.statusCode == 200) {
      Map peopleData = jsonDecode(response.body);
      List<dynamic> peoples = peopleData["results"];
      return peoples.map((json) {
        return PersonModel.fromJson(json);
      }).toList();
    } else {
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
  }
}
