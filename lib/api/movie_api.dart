import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie_model/movie_model.dart';

Future<List<MovieModel>> fetchMovies(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final decodedData = json.decode(response.body)["results"] as List;
    return decodedData.map((movie) => MovieModel.fromJson(movie)).toList();
  } else {
    throw Exception("some think happned");
  }
}


