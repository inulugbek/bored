import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
abstract class DefaultTheme {
  static const primaryColor = Colors.black;
  static const accentColor = Colors.white;

  static final ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: _appBarTheme,
    bottomAppBarTheme: _bottomAppBarTheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    buttonTheme: _buttonThemeData,
    primaryColor: primaryColor,
    accentColor: accentColor,
    buttonColor: primaryColor,
  );

  static const AppBarTheme _appBarTheme = AppBarTheme(
    brightness: Brightness.light,
    elevation: 0,
  );

  static const BottomAppBarTheme _bottomAppBarTheme = BottomAppBarTheme();

  static const TextTheme _textTheme = TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    headline4: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    headline5: TextStyle(),
    headline6: TextStyle(),
    subtitle1: TextStyle(),
    bodyText1: TextStyle(
      color: accentColor,
    ),
    bodyText2: TextStyle(
      color: primaryColor,
    ),
  );

  static const InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    border: OutlineInputBorder(),
  );

  static const ButtonThemeData _buttonThemeData = ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    textTheme: ButtonTextTheme.accent,
  );
}
