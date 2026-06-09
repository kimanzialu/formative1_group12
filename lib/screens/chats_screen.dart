import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.aluWhite,
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      body: const Center(
        child: Text(
          'Chats Screen',
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