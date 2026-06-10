import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'onboarding_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.navy,
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 48,
              backgroundColor: AppTheme.gold,
              child: Icon(
                Icons.person,
                size: 52,
                color: AppTheme.deepNavy,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'ALU Student',
              style: TextStyle(
                color: AppTheme.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Kigali Campus',
              style: TextStyle(
                color: AppTheme.mutedText,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 28),
            _profileOption(Icons.event_available, 'My Events'),
            _profileOption(Icons.bookmark_outline, 'Saved Opportunities'),
            _profileOption(Icons.groups_outlined, 'My Communities'),
            _profileOption(Icons.settings_outlined, 'Account Settings'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: () => _logout(context),
                icon: const Icon(Icons.logout),
                label: const Text('Log out'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileOption(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardNavy,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.borderBlue),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.gold),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppTheme.white,
                fontSize: 16,
              ),
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: AppTheme.mutedText,
          ),
        ],
      ),
    );
  }
}