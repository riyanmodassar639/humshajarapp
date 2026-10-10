import 'package:flutter/material.dart';
import 'book_data.dart';
import 'app_theme.dart';
import 'chapter_card.dart';
import 'chapter_screen.dart';

/// The landing page of the app: designed for mobile with a native feel.
/// Features a compact header with the cover, title, and author,
/// followed by the list of chapters/sections.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: screenWidth,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const _HeroSection(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                    child: Column(
                      children: List.generate(
                        bookChapters.length,
                        (index) {
                          final chapter = bookChapters[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: ChapterCard(
                              chapter: chapter,
                              onTap: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    transitionDuration: const Duration(milliseconds: 150),
                                    reverseTransitionDuration: const Duration(milliseconds: 150),
                                    pageBuilder: (_, __, ___) => ChapterScreen(chapter: chapter),
                                    transitionsBuilder: (_, animation, __, child) {
                                      return FadeTransition(opacity: animation, child: child);
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Mobile-friendly hero section.
class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 32, 20, 24),
      decoration: const BoxDecoration(
        color: AppColors.paper,
        border: Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Book Cover on the Right in RTL (first child)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border, width: 0.5),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.ink.withOpacity(0.15),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: Image.asset(
                    'assets/images/cover.png',
                    width: 120,
                    height: 175,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              // Text Content on the Left in RTL (second child)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ہم شجر',
                      style: TextStyle(
                        fontFamily: kNastaleeqFont,
                        fontSize: 48,
                        color: AppColors.primary,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'حارث بلال',
                      style: TextStyle(
                        fontFamily: kNastaleeqFont,
                        fontSize: 26,
                        color: AppColors.inkSoft,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.primary.withOpacity(0.15)),
                      ),
                      child: const Text(
                        'پہلا مجموعۂ کلام',
                        style: TextStyle(
                          fontFamily: kNastaleeqFont,
                          fontSize: 16,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          const Text(
            'نعت، سلام اور غزلیات پر مشتمل یہ کتاب 2025 میں کولاج پبلیکیشنز، لاہور سے شائع ہوئی۔',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.inkSoft,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}
