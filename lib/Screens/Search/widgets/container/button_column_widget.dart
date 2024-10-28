import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Search/widgets/buttons/button_search_screen.dart';
import 'package:movie_app/widgets/SpaceWidgets/sized_box.dart';

Column buttonsColumnWidget() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buttonsSearchScreen("Action and\nadventure"),
          sizedBox(0, 10),
          buttonsSearchScreen("Anime"),
        ],
      ),
      sizedBox(10, 0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buttonsSearchScreen("Comedy"),
          sizedBox(0, 10),
          buttonsSearchScreen("Documentary"),
        ],
      ),
      sizedBox(10, 0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buttonsSearchScreen("Drama"),
          sizedBox(0, 10),
          buttonsSearchScreen("Fantasy"),
        ],
      ),
    ],
  );
}
