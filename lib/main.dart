import 'package:flutter/material.dart';
import 'package:flutter_music_appl/pages/home_page.dart';
import 'package:flutter_music_appl/themes/dark_mode.dart';
import 'package:flutter_music_appl/themes/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: lightMode,
    );
  }
}
