import 'package:flutter/material.dart';
import 'poem.dart';
import 'app_theme.dart';

/// A single chapter/section tile shown on the landing page — e.g.
/// "نعت و سلام" or "غزل" — styled as a modern card.
class ChapterCard extends StatelessWidget {
  final Chapter chapter;
  final VoidCallback onTap;

  const ChapterCard({super.key, required this.chapter, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.card,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chapter.titleUrdu,
                      style: const TextStyle(
                        fontFamily: kNastaleeqFont,
                        fontSize: 26,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      chapter.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.inkSoft,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '${chapter.poems.length} کلام',
                      style: const TextStyle(
                        fontFamily: kNastaleeqFont,
                        fontSize: 16,
                        color: AppColors.inkSoft,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(Icons.arrow_back_ios, color: AppColors.border, size: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

