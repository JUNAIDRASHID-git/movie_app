import 'package:flutter/material.dart';
import 'package:movie_app/assets/Colors/colors.dart';

ShaderMask mainFontWidget(double fontSize) {
  return ShaderMask(
    shaderCallback: (bounds) {
      return logoFontColor
          .createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
    },
    child: Text(
      "C I N E M A T E",
      style: TextStyle(
        color: whiteColor,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        fontFamily: "Arial",
      ),
    ),
  );
}
