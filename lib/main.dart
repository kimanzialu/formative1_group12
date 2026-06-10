import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const AluIntercampusApp());
}

class AluIntercampusApp extends StatelessWidget {
  const AluIntercampusApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ALU Intercampus Connect',
      debugShowCheckedModeBanner: false,
      
      // Defining the global dark theme matching the design system
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff0F0F16),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xffFF6B00), // ALU orange brand color
          surface: Color(0xff1E1E2A),
          background: const Color(0xff0F0F16),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff0F0F16),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      
      // Sets the home screen layout you created as the entry point
      home: const HomeScreen(),
    );
  }
}