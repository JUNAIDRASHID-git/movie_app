import 'package:flutter/material.dart';
import 'package:movie_app/assets/Colors/colors.dart';

ElevatedButton buttonsSearchScreen(String title) {
  return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(searchScreenButtonColor),
          shape: const WidgetStatePropertyAll(BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2)))),
          fixedSize: const WidgetStatePropertyAll(Size(190, 56))),
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(color: whiteColor, fontWeight: FontWeight.w800),
      ));
}
