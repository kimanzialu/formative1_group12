import 'package:flutter/material.dart';
import 'patrick_event_details/events_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pulse',
      debugShowCheckedModeBanner: false, // Remove debug sign
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFFFB800),
        scaffoldBackgroundColor: const Color(0xFF0F172A)
      ),
      home: const EventsMainScreen(),
    );
  }
}
