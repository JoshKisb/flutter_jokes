import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jokes_app/models/joke.dart';
import 'package:jokes_app/utils/urls.dart';

class ApiService {
  Future<Joke> fetchRandomJoke() async {
    try {
      final response = await http.get(ApiUrls.joke);
      final jsonResponse = json.decode(response.body);
      return Joke.fromJson(jsonResponse);
    } catch (e) {
      print(e);
      return Future.error("Failed to fetch joke");
    }
  }

  Future<List<Joke>> fetchJokes([String category]) async {
    String url =
        category == null ? ApiUrls.jokes : ApiUrls.jokesOfType(category);

    try {
      final response = await http.get(url);      
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((jsonJoke) => Joke.fromJson(jsonJoke)).toList();
    } catch (e) {
      print(e);
      return Future.error("Failed to fetch jokes");
    }
  }
}
