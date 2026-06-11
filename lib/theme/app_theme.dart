import 'package:flutter/material.dart';

class AppTheme {
  static const Color navy = Color(0xFF0A1628);
  static const Color deepNavy = Color(0xFF060E1A);
  static const Color cardNavy = Color(0xFF112240);
  static const Color softNavy = Color(0xFF1A3A6B);
  static const Color gold = Color(0xFFFFB703);
  static const Color goldDark = Color(0xFFE6A500);
  static const Color white = Color(0xFFFFFFFF);
  static const Color softWhite = Color(0xFFF0F4F8);
  static const Color mutedText = Color(0xFF8899AA);
  static const Color borderBlue = Color(0xFF1E3A5F);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: navy,
    primaryColor: gold,
    fontFamily: 'Roboto',
    colorScheme: const ColorScheme.dark(
      primary: gold,
      secondary: gold,
      surface: cardNavy,
      error: Color(0xFFFF4444),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: navy,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.3,
      ),
      iconTheme: IconThemeData(color: white),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: deepNavy,
      selectedItemColor: gold,
      unselectedItemColor: Color(0xFF556677),
    ),
  );
}