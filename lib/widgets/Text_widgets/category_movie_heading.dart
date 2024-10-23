import 'package:flutter/material.dart';

Padding categoryHeadingText(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, top: 15,bottom: 15),
    child: Text(text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
  );
}
