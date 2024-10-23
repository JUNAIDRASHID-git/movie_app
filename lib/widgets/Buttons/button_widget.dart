import 'package:flutter/material.dart';
import 'package:movie_app/assets/Colors/colors.dart';

Padding buttonWidget(String buttonTitle, void Function()? onPressed) {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: ElevatedButton(
        style: const ButtonStyle(
            padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 12, vertical: 11)),
            side: WidgetStatePropertyAll(
              BorderSide(width: 1, color: Colors.grey),
            )),
        onPressed: onPressed,
        child: Text(
          buttonTitle,
          style: TextStyle(
              fontSize: 11, fontWeight: FontWeight.w500, color: whiteColor),
        )),
  );
}
