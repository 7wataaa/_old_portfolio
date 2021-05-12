import 'package:flutter/material.dart';

MaterialColor materialColor(int i) => MaterialColor(i, <int, Color>{
      50: Color(i),
      100: Color(i),
      200: Color(i),
      300: Color(i),
      400: Color(i),
      500: Color(i),
      600: Color(i),
      700: Color(i),
      800: Color(i),
      900: Color(i),
    });

ThemeData lightTheme = ThemeData(
  primarySwatch: materialColor(0xffFFFFFF),
  textTheme: const TextTheme(
    bodyText1: TextStyle(fontSize: 20),
  ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: materialColor(0xffFFFFFF),
  textTheme: const TextTheme(
    bodyText1: TextStyle(fontSize: 20),
  ),
  brightness: Brightness.dark,
);
