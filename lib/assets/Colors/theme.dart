
import 'package:flutter/material.dart';
import 'package:movie_app/assets/Colors/colors.dart';

ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme:  TextTheme(
        bodyLarge: TextStyle(color: whiteColor),
      ),
    );
  }

  ThemeData whiteTheme() {
    return ThemeData(
      brightness: Brightness.light,
      textTheme:  TextTheme(
        bodyLarge: TextStyle(color: blackColor),
      ),
    );
  }