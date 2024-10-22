import 'package:flutter/material.dart';
import 'package:movie_app/assets/Colors/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Center dotIndicator(int listLenght, int activeIndex) {
  return Center(
    child: AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: listLenght,
        effect: JumpingDotEffect(
            dotHeight: 6,
            dotWidth: 6,
            radius: 30,
            verticalOffset: 5,
            dotColor: Colors.grey,
            activeDotColor: whiteColor)),
  );
}
