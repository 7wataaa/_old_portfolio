import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

const appTextTheme = TextTheme(
  subtitle1: TextStyle(
    fontFamily: 'Noto Sans JP',
    fontSize: 24,
    fontWeight: FontWeight.w100,
  ),
  bodyText1: TextStyle(
    fontFamily: 'Noto Sans JP',
    fontSize: 17,
    fontWeight: FontWeight.w100,
  ),
);

ThemeData lightTheme = ThemeData(
  primarySwatch: materialColor(0xffFFFFFF),
  fontFamily: 'Noto Sans JP',
);

ThemeData darkTheme = ThemeData(
  textTheme: appTextTheme,
  primarySwatch: materialColor(0xffFFFFFF),
  brightness: Brightness.dark,
  fontFamily: 'Noto Sans JP',
);

final themeNotifierProvider =
    StateNotifierProvider<ThemeStateNotifier, ThemeData>((ref) {
  return ThemeStateNotifier();
});

class ThemeStateNotifier extends StateNotifier<ThemeData> {
  ThemeStateNotifier() : super(darkTheme);

  bool _isDark = false;

  void toggleTheme() {
    _isDark = !_isDark;
    state = _isDark ? darkTheme : lightTheme;
  }
}
