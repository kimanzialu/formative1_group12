import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool showContent = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 250), () {
      if (!mounted) return;
      setState(() {
        showContent = true;
      });
    });
  }

  void _goToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  void _goToSignup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SignupScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.deepNavy,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppTheme.deepNavy,
              AppTheme.navy,
              AppTheme.deepNavy,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: AnimatedOpacity(
            opacity: showContent ? 1 : 0,
            duration: const Duration(milliseconds: 700),
            child: Padding(
              padding: const EdgeInsets.all(26),
              child: Column(
                children: [
                  _topBar(),

                  const Spacer(),

                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.85, end: 1.0),
                    duration: const Duration(milliseconds: 900),
                    curve: Curves.elasticOut,
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: child,
                      );
                    },
                    child: _aluBadge(),
                  ),

                  const SizedBox(height: 34),

                  const Text(
                    'Connect across\nALU campuses.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      height: 1.12,
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    'Discover events, communities, and student opportunities in one simple space.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.mutedText,
                      fontSize: 15.5,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 28),

                  _campusCard(),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () => _goToLogin(context),
                      icon: const Icon(Icons.school_rounded),
                      label: const Text(
                        'Sign in with ALU Account',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: _socialLoginButton(
                          icon: Icons.g_mobiledata_rounded,
                          label: 'Google',
                          onTap: () => _goToLogin(context),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _socialLoginButton(
                          icon: Icons.apple_rounded,
                          label: 'Apple',
                          onTap: () => _goToLogin(context),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  GestureDetector(
                    onTap: () => _goToSignup(context),
                    child: const Text.rich(
                      TextSpan(
                        text: 'New here? ',
                        style: TextStyle(color: AppTheme.mutedText),
                        children: [
                          TextSpan(
                            text: 'Create account',
                            style: TextStyle(
                              color: AppTheme.gold,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'ALU Connect',
          style: TextStyle(
            color: AppTheme.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(
            color: AppTheme.cardNavy,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppTheme.borderBlue),
          ),
          child: const Text(
            'Student Hub',
            style: TextStyle(
              color: AppTheme.gold,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Widget _aluBadge() {
    return Container(
      width: 138,
      height: 138,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppTheme.cardNavy,
        border: Border.all(
          color: AppTheme.gold,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.gold.withOpacity(0.28),
            blurRadius: 32,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 96,
          height: 96,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.gold,
          ),
          child: const Center(
            child: Text(
              'ALU',
              style: TextStyle(
                color: AppTheme.deepNavy,
                fontSize: 30,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _campusCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppTheme.cardNavy.withOpacity(0.95),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.borderBlue),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.public_rounded,
            color: AppTheme.gold,
            size: 28,
          ),
          SizedBox(width: 14),
          Expanded(
            child: Text(
              'Kigali • Mauritius • Online',
              style: TextStyle(
                color: AppTheme.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialLoginButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppTheme.cardNavy.withOpacity(0.95),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppTheme.gold),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppTheme.gold,
              size: 24,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: AppTheme.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}