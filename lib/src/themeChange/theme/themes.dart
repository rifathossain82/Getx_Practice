import 'package:flutter/material.dart';

class Themes{

  final lightTheme= ThemeData.light().copyWith(
    primaryColor: Colors.blueGrey[300],
    appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        backgroundColor: Colors.blueGrey[300],
        foregroundColor: Colors.white,
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.black),
        ),
    ),
    buttonColor: Colors.pink,
  );

  final darkTheme= ThemeData.dark().copyWith(
    primaryColor: Colors.blueGrey[800],
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      backgroundColor: Colors.blueGrey[800],
      foregroundColor: Colors.white,
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.white),
      ),
    ),
    buttonColor: Colors.green,
  );
}