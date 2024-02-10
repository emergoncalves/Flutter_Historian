import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 14,
        height: 1.4,
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    ),
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.dark(
        background: Colors.grey.shade300,
      ),
    ),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.grey,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: Colors.grey,
        fontSize: 14,
        height: 1.4,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      colorScheme: ColorScheme.dark(
        background: Color(0xFF302B36),
      ),
    ),
  );
}
