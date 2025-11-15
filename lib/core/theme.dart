import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Colors.white,
        onPrimary: Colors.black,
        secondary: Color(0xFFdfcdfd),
        onSecondary: Colors.black,
        tertiary: Color(0xFF545454),
        onTertiary: Colors.white,
        primaryContainer: Color(0xFFede9fe),
        onPrimaryContainer: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.white,
        onSurface: Colors.black,
      ),
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          color: Colors.black26,
        ),
      ),
    );
  }
}
