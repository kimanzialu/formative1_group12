import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'main_navigation_screen.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String? selectedCampus;
  String? errorMessage;
  bool isLoading = false;

  final List<String> campuses = [
    'Kigali Campus',
    'Mauritius Campus',
    'Online Student',
  ];

  void _createAccount() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();

    setState(() {
      errorMessage = null;
    });

    if (name.isEmpty || email.isEmpty || selectedCampus == null) {
      setState(() {
        errorMessage = 'Please fill in all fields.';
      });
      return;
    }

    if (!email.contains('@')) {
      setState(() {
        errorMessage = 'Please enter a valid email address.';
      });
      return;
    }

    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainNavigationScreen()),
      );
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.navy,
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Join ALU Connect',
                style: TextStyle(
                  color: AppTheme.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Create your student profile to start discovering campus activities and opportunities.',
                style: TextStyle(
                  color: AppTheme.mutedText,
                  fontSize: 15,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 28),

              TextField(
                controller: nameController,
                style: const TextStyle(color: AppTheme.white),
                decoration: const InputDecoration(
                  labelText: 'Full name',
                  hintText: 'Enter your name',
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: AppTheme.white),
                decoration: const InputDecoration(
                  labelText: 'Email address',
                  hintText: 'example@alustudent.com',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value: selectedCampus,
                decoration: const InputDecoration(
                  labelText: 'Campus',
                  prefixIcon: Icon(Icons.location_on_outlined),
                ),
                dropdownColor: AppTheme.cardNavy,
                style: const TextStyle(color: AppTheme.white),
                items: campuses.map((campus) {
                  return DropdownMenuItem(
                    value: campus,
                    child: Text(campus),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCampus = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              if (errorMessage != null)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(0.14),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.redAccent.withOpacity(0.35),
                    ),
                  ),
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                ),

              const SizedBox(height: 26),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: isLoading ? null : _createAccount,
                  child: isLoading
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppTheme.deepNavy,
                          ),
                        )
                      : const Text(
                          'Create Account',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                  child: const Text(
                    'Already have an account? Sign in',
                    style: TextStyle(
                      color: AppTheme.gold,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}