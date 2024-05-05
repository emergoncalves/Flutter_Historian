import 'package:flutter/material.dart';

class AppTheme {
  static const fontFamily = 'Inter';

  static final lightTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 14,
        height: 1.4,
        fontFamily: fontFamily,
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
      ),
    ),
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.dark(
        background: Colors.grey.shade300,
      ),
    ),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color.fromARGB(255, 21, 11, 68),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.grey,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
      ),
      bodySmall: TextStyle(
        color: Colors.grey,
        fontSize: 14,
        height: 1.4,
        fontFamily: fontFamily,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      colorScheme: ColorScheme.dark(
        background: Color.fromARGB(255, 106, 13, 219),
      ),
    ),
  );
}
