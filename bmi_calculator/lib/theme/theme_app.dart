import 'package:flutter/material.dart';

abstract class ThemeApp {
  static const ralewaySemiBoldFont = 'raleway_semibold';
  static const ralewayBoldFont = 'raleway_bold';

  static const darkBlueColor = 0xFF2566CF;
  static const mediumBlueColor = 0xFF5387DA;
  static const lightBlueColor = 0xFFDFE9F9;

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: const Color(darkBlueColor),
      primaryColorLight: const Color(lightBlueColor),
      fontFamily: ralewayBoldFont,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24.0,
          fontFamily: ralewayBoldFont,
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
    );
  }
}
