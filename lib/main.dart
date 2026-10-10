import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'splash_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(const HumShajarApp());
}

class HumShajarApp extends StatelessWidget {
  const HumShajarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ہم شجر',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: const SplashScreen(),
    );
  }
}

