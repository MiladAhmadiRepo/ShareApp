import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class Api {
  final http.Client client;

  Api({required this.client});

  Future<String> getRandomJoke() async {
    try {
      final response = await client.get(
        Uri.parse('https://official-joke-api.appspot.com/random_joke'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final joke = json.decode(response.body);
        return 'HERE\'S THE JOKE\n${joke['setup']}\n${joke['punchline']}';
      } else {
        return 'Something went wrong';
      }
    } catch (error) {
      return 'An error occured';
    }
  }
}