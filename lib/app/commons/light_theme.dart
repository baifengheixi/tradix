import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData getTheme() {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    );
  }
}
