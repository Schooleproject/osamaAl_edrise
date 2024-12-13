// Dark theme data
 import 'package:flutter/material.dart';

ThemeData get darkTheme {
  return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      primaryColor: Colors.blueGrey,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white70),
        bodySmall: TextStyle(color: Colors.white),
      ));
}
