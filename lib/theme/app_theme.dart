import 'package:flutter/material.dart';

class AppTheme {
  static const Color aluBlue = Color(0xFF002147);
  static const Color aluLightBlue = Color(0xFFEAF2FF);
  static const Color aluRed = Color(0xFFE63946);
  static const Color aluWhite = Color(0xFFFFFFFF);
  static const Color aluGrey = Color(0xFFF5F7FA);
  static const Color darkText = Color(0xFF1F2937);
  static const Color mutedText = Color(0xFF6B7280);
  static const Color borderGrey = Color(0xFFE5E7EB);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: aluWhite,
    primaryColor: aluBlue,
    fontFamily: 'Roboto',
    colorScheme: const ColorScheme.light(
      primary: aluBlue,
      secondary: aluRed,
      surface: aluWhite,
      error: aluRed,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: aluWhite,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: aluBlue,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: aluBlue),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: aluWhite,
      selectedItemColor: aluRed,
      unselectedItemColor: mutedText,
      type: BottomNavigationBarType.fixed,
      elevation: 12,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: aluGrey,
      hintStyle: const TextStyle(color: mutedText),
      labelStyle: const TextStyle(color: mutedText),
      prefixIconColor: aluBlue,
      suffixIconColor: mutedText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: borderGrey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: borderGrey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: aluRed, width: 1.5),
      ),
    ),
  );
}