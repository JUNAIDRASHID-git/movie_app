import 'package:flutter/material.dart';
import 'package:movie_app/assets/Colors/colors.dart';

Padding movieLangWidget(String title, Function()? onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.3, color: Colors.grey),
            bottom: BorderSide(width: 0.5, color: Colors.grey),
          ),
        ),
        child: ListTile(
          minTileHeight: 48,
          title: Text(
            title,
            style: TextStyle(
                fontSize: 16, color: whiteColor, fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            weight: 100,
          ),
        ),
      ),
    ),
  );
}
