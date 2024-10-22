import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_app/widgets/Bars/nav_bar.dart';
import 'package:movie_app/widgets/main_font_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const NavBar())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: mainFontWidget(40),
      ),
    );
  }
}
