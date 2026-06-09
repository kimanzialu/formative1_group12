import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.aluWhite,
      appBar: AppBar(
        title: const Text('Explore'),
      ),
      body: const Center(
        child: Text(
          'Explore Screen',
          style: TextStyle(
            color: AppTheme.aluBlue,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}