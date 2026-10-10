import 'package:flutter/material.dart';
import 'poem.dart';
import 'app_theme.dart';
import 'poem_tile.dart';
import 'poem_screen.dart';

/// Lists every poem that belongs to one chapter/section (e.g. all the
/// ghazals, or the naats & salam).
class ChapterScreen extends StatelessWidget {
  final Chapter chapter;

  const ChapterScreen({super.key, required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.paper,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.paper,
            surfaceTintColor: Colors.transparent,
            scrolledUnderElevation: 0,
            elevation: 0,
            pinned: true,
            expandedHeight: 180,
            iconTheme: const IconThemeData(color: AppColors.primary),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              tooltip: 'Back',
              onPressed: () => Navigator.of(context).pop(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: const EdgeInsets.only(bottom: 16),
              title: Text(
                chapter.titleUrdu,
                style: const TextStyle(
                  fontFamily: kNastaleeqFont,
                  color: AppColors.primary,
                  fontSize: 28,
                ),
              ),
              background: Center(
                child: Icon(
                  Icons.auto_stories_rounded,
                  size: 72,
                  color: AppColors.primary.withOpacity(0.25),
                ),
              ),
            ),
          ),
          if (chapter.poems.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Text(
                  'یہ حصہ ابھی شامل نہیں کیا گیا',
                  style: const TextStyle(
                    fontFamily: kNastaleeqFont,
                    fontSize: 20,
                    color: AppColors.inkSoft,
                  ),
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final poem = chapter.poems[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: PoemTile(
                        poem: poem,
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 150),
                              reverseTransitionDuration: const Duration(milliseconds: 150),
                              pageBuilder: (_, __, ___) => PoemScreen(
                                poem: poem,
                                chapterTitle: chapter.titleUrdu,
                              ),
                              transitionsBuilder: (_, animation, __, child) {
                                return FadeTransition(opacity: animation, child: child);
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                  childCount: chapter.poems.length,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

