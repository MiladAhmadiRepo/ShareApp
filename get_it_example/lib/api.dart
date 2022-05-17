import 'dart:convert';

import 'package:get_it_example/model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class Api {
  final http.Client client;

  Api({required this.client});

  Future<String> getRandomJoke() async {
    try {
      final response = await client.get(
        Uri.parse('https://api.jokes.one/jod'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final joke = json.decode(response.body);
        final model=Model.fromJson(joke);
        return '${model.contents?.jokes?[0].joke?.text.toString()}';
      } else {
        return 'Something went wrong';
      }
    } catch (error) {
      return 'An error occured';
    }
  }
}