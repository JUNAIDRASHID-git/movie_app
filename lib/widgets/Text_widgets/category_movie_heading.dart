import 'package:flutter/material.dart';

Padding categoryHeadingText(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, top: 10,bottom: 10),
    child: Text(text,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
  );
}
