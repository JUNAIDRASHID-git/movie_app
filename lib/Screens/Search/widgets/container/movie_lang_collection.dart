import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Search/widgets/buttons/movie_lang_button.dart';

Column movieLangCollection() {
  return Column(
    children: [
      movieLangWidget("Hindi", () {}),
      movieLangWidget("English", () {}),
      movieLangWidget("Telugu", () {}),
      movieLangWidget("Tamil", () {}),
      movieLangWidget("Malayalam", () {}),
    ],
  );
}
