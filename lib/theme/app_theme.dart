import 'package:flutter/material.dart';

class AppTheme {
  static const Color navy = Color(0xFF001B36);
  static const Color deepNavy = Color(0xFF001225);
  static const Color cardNavy = Color(0xFF0B2745);
  static const Color softNavy = Color(0xFF123456);
  static const Color gold = Color(0xFFFFB703);
  static const Color goldDark = Color(0xFFE69A00);
  static const Color white = Color(0xFFFFFFFF);
  static const Color softWhite = Color(0xFFF5F7FA);
  static const Color mutedText = Color(0xFF9FB3C8);
  static const Color borderBlue = Color(0xFF1C3D5A);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: navy,
    primaryColor: gold,
    fontFamily: 'Roboto',
<<<<<<< HEAD
=======

>>>>>>> person1-auth-navigation
    colorScheme: const ColorScheme.dark(
      primary: gold,
      secondary: gold,
      surface: cardNavy,
<<<<<<< HEAD
      error: Color(0xFFFF4444),
    ),
=======
      error: Colors.redAccent,
    ),

>>>>>>> person1-auth-navigation
    appBarTheme: const AppBarTheme(
      backgroundColor: navy,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: white,
<<<<<<< HEAD
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
=======
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: white),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: deepNavy,
      selectedItemColor: gold,
      unselectedItemColor: mutedText,
      type: BottomNavigationBarType.fixed,
      elevation: 12,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: cardNavy,
      hintStyle: const TextStyle(color: mutedText),
      labelStyle: const TextStyle(color: mutedText),
      prefixIconColor: mutedText,
      suffixIconColor: mutedText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: borderBlue),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: borderBlue),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: gold, width: 1.5),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: gold,
        foregroundColor: deepNavy,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: gold,
        side: const BorderSide(color: gold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
>>>>>>> person1-auth-navigation
    ),
  );
}