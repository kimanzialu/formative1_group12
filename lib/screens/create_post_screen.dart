import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.aluWhite,
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: const Center(
        child: Text(
          'Create Post Screen',
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