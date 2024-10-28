import 'package:flutter/material.dart';
import 'package:movie_app/Screens/SplacshScreen/spalash_screen.dart';
import 'package:movie_app/assets/Colors/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CineMate',
      theme: whiteTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
