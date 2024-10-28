import 'package:flutter/material.dart';
import 'package:movie_app/assets/Colors/colors.dart';

Row seeMoreButton() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(searchScreenButtonColor)),
          onPressed: () {},
          child: Text(
            "See more",
            style: TextStyle(color: whiteColor),
          ))
    ],
  );
}
