import 'package:flutter/material.dart';

/// Central place for the app's look & feel. Palette is pulled from the
/// new website design: minimalist cream background, deep green primary,
/// and charcoal ink for text.
class AppColors {
  static const cream = Color(0xFFF9F6F0);
  static const paper = Color(0xFFFCFBF9);
  static const card = Color(0xFFFFFFFF);
  static const ink = Color(0xFF262626);
  static const inkSoft = Color(0xFF6B6B6B);
  static const primary = Color(0xFF2D5A46); // Deep green from website
  static const border = Color(0xFFE5E0D8);
}

/// The custom Urdu Nastaleeq typeface. Register the actual font file at
/// assets/fonts/JameelNooriNastaleeq.ttf and in pubspec.yaml — see
/// FONT_SETUP.md. Referencing the family name here is all screens need.
const String kNastaleeqFont = 'JameelNooriNastaleeq';

class AppTheme {
  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.cream,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
        surface: AppColors.cream,
        primary: AppColors.primary,
      ),
      fontFamily: kNastaleeqFont,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.cream,
        foregroundColor: AppColors.ink,
        elevation: 0,
        scrolledUnderElevation: 1,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: kNastaleeqFont,
          color: AppColors.ink,
          fontSize: 22,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
        space: 32,
      ),
    );

    return base.copyWith(
      textTheme: base.textTheme.apply(
        fontFamily: kNastaleeqFont,
        bodyColor: AppColors.ink,
        displayColor: AppColors.ink,
      ),
    );
  }

  /// Large display style for the book title on the landing page.
  static const titleDisplay = TextStyle(
    fontFamily: kNastaleeqFont,
    fontSize: 56,
    color: AppColors.primary,
    height: 1.3,
  );

  /// Style used for a poem's couplet lines on the reading screen —
  /// generously sized and spaced for comfortable Nastaleeq reading.
  static const verseText = TextStyle(
    fontFamily: kNastaleeqFont,
    fontSize: 26,
    height: 2.2,
    color: AppColors.ink,
  );

  /// Style for section headers (چیپٹر titles).
  static const sectionHeader = TextStyle(
    fontFamily: kNastaleeqFont,
    fontSize: 30,
    color: AppColors.primary,
  );

  /// Style used for a poem title / preview line in list rows.
  static const listTitle = TextStyle(
    fontFamily: kNastaleeqFont,
    fontSize: 20,
    color: AppColors.ink,
    height: 1.6,
  );
}

