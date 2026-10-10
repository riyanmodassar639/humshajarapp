import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // 1 = Cover, 2 = Poet
  int _step = 1;
  bool _isTransitioningOut = false;

  @override
  void initState() {
    super.initState();
    _playAnimationSequence();
  }

  // Pre-load images for smoother performance on web
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(const AssetImage('assets/images/cover.png'), context);
    precacheImage(const AssetImage('assets/images/poet.jpg'), context);
  }

  Future<void> _playAnimationSequence() async {
    // Wait while Cover is shown
    await Future.delayed(const Duration(milliseconds: 3500));
    if (!mounted) return;

    // Fade out Cover, Fade in Poet
    setState(() => _step = 2);
    // Reduced poet image duration as requested
    await Future.delayed(const Duration(milliseconds: 2500));
    if (!mounted) return;

    // Fade everything out
    setState(() => _isTransitioningOut = true);
    await Future.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;

    // Navigate to Home
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 1000),
        pageBuilder: (_, __, ___) => const HomeScreen(),
        transitionsBuilder: (_, animation, __, child) {
          final slide = Tween<Offset>(begin: const Offset(0, 0.05), end: Offset.zero)
              .animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));
          return FadeTransition(opacity: animation, child: SlideTransition(position: slide, child: child));
        },
      ),
    );
  }

  Widget _buildCoverView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 380,
          width: 260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: AppColors.ink.withOpacity(0.12), blurRadius: 25, offset: const Offset(0, 12)),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset('assets/images/cover.png', fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 36),
        SizedBox(
          width: 260,
          child: const Text(
            'ہم شجر',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: kNastaleeqFont, fontSize: 52, color: AppColors.primary),
          ),
        ),
      ],
    );
  }

  Widget _buildPoetView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 380,
          width: 260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: AppColors.ink.withOpacity(0.12), blurRadius: 25, offset: const Offset(0, 12)),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset('assets/images/poet.jpg', fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 36),
        SizedBox(
          width: 260,
          child: Column(
            children: [
              const Text(
                'شاعر: حارث بلال',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: kNastaleeqFont, fontSize: 38, color: AppColors.primary),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4)),
                  ],
                ),
                child: const Text(
                  'پہلا مجموعۂ کلام',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: kNastaleeqFont, fontSize: 18, color: AppColors.cream),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.paper,
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 800),
          opacity: _isTransitioningOut ? 0.0 : 1.0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                opacity: _step == 1 ? 1.0 : 0.0,
                child: _buildCoverView(),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                opacity: _step == 2 ? 1.0 : 0.0,
                child: _buildPoetView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

