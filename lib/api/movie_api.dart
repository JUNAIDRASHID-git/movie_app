import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/api/constant.dart';
import 'package:movie_app/models/movie_model/movie_model.dart';

ValueNotifier<List<MovieModel>> movieNotifier = ValueNotifier([]);
ValueNotifier<List<MovieModel>> preLoadMovieNotifier = ValueNotifier([]);

Future<List<MovieModel>> fetchMovies(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final decodedData = json.decode(response.body)["results"] as List;
    return decodedData.map((movie) => MovieModel.fromJson(movie)).toList();
  } else {
    throw Exception("some think happned");
  }
}

void preloadMovies() async {
  final response = await http.get(Uri.parse(Constant.popularUrl));

  if (response.statusCode == 200) {
    final decodedData = json.decode(response.body)["results"] as List;
    final datas =
        decodedData.map((movie) => MovieModel.fromJson(movie)).toList();
    for (var element in datas) {
      preLoadMovieNotifier.value.add(element);
      preLoadMovieNotifier.notifyListeners();
    }
  } else {
    throw Exception("some think happned");
  }
}

void searchMovies(String search) async {
  final response = await http.get(Uri.parse(
      "https://api.themoviedb.org/3/search/movie?query=$search&api_key=${Constant.apiKey}"));

  if (response.statusCode == 200) {
    final decodedData = json.decode(response.body)["results"] as List;
    final datas =
        decodedData.map((movie) => MovieModel.fromJson(movie)).toList();
    for (var element in datas) {
      movieNotifier.value.add(element);
      movieNotifier.notifyListeners();
    }
    print(movieNotifier.value);
  } else {
    throw Exception("some think happned");
  }
}
