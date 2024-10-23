 import 'package:flutter/material.dart';
import 'package:movie_app/widgets/Buttons/button_widget.dart';

Row buttonRowWidget() {
    return Row(
              children: [
                buttonWidget("Movies", () {}),
                buttonWidget("TV shows", () {}),
                buttonWidget("Live TV", () {}),
              ],
            );
  }