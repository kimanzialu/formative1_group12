import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.navy,
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppTheme.cardNavy,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppTheme.borderBlue),
          ),
          child: const Text(
            'Create Event or Opportunity\nPerson 4 will build this.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}