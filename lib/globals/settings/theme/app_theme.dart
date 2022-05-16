import 'package:flutter/material.dart';

// Kinda like a getter to import theme from other files
final ThemeData blindSideTheme = _blindSideTheme();

//Define Base theme for app
ThemeData _blindSideTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: Colors.black38,
      onPrimary: Colors.white,
      secondary: Colors.amber,
      onSecondary: Colors.black,
      error: Colors.red,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: _asthaTutorialTextTheme(base.textTheme),
    // below text theme add this
    // Define styles for elevated button
    elevatedButtonTheme: _elevatedButtonTheme(base.elevatedButtonTheme),

    // Define theme for text input
    textButtonTheme: _textButtonThemeData(base.textButtonTheme),

    // Set Themes for Input Your homework
    inputDecorationTheme: _inputDecorationTheme(base.inputDecorationTheme),
  );
}

// Outside of _asthaTutorialTheme function  create another function

TextTheme _asthaTutorialTextTheme(TextTheme base) => base.copyWith(
// This'll be our appbars title
      headline1: base.headline1!.copyWith(
          fontFamily: "Proxima Nova Rg Regular",
          fontSize: 30,
          fontWeight: FontWeight.w500,
          color: Colors.white),
// for widgets heading/title
      headline2: base.headline2!.copyWith(
        fontFamily: "Proxima Nova Rg Regular",
        fontSize: 26,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
// for sub-widgets heading/title
      headline3: base.headline3!.copyWith(
        fontFamily: "Proxima Nova Rg Regular",
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
// for widgets contents/paragraph
      bodyText1: base.bodyText1!.copyWith(
          fontFamily: "Proxima Nova Rg Regular",
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: Colors.black),
// for sub-widgets contents/paragraph
      bodyText2: base.bodyText2!.copyWith(
          fontFamily: "Proxima Nova Rg Regular",
          fontSize: 18,
          fontWeight: FontWeight.w300,
          color: Colors.black),
    );

InputDecorationTheme _inputDecorationTheme(InputDecorationTheme base) =>
    const InputDecorationTheme(
// Label color for the input widget
      labelStyle: TextStyle(color: Colors.black),
// Define border of input form while focused on
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.0,
          color: Colors.black,
          style: BorderStyle.solid,
        ),
      ),
    );

ElevatedButtonThemeData _elevatedButtonTheme(ElevatedButtonThemeData base) =>
    ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.amber,
          ),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          elevation: MaterialStateProperty.all<double>(5)),
    );

TextButtonThemeData _textButtonThemeData(TextButtonThemeData base) =>
    TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.amber),
      ),
    );
