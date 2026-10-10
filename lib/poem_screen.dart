import 'package:flutter/material.dart';
import 'poem.dart';
import 'app_theme.dart';

/// Full-screen reading view for a single poem — each couplet (sher) is
/// centered and spaced generously, in the Jameel Noori Nastaleeq font,
/// with a simple A+/A- control so readers can adjust text size.
class PoemScreen extends StatefulWidget {
  final Poem poem;
  final String chapterTitle;

  const PoemScreen({super.key, required this.poem, required this.chapterTitle});

  @override
  State<PoemScreen> createState() => _PoemScreenState();
}

class _PoemScreenState extends State<PoemScreen> {
  double _fontSize = 26;

  void _changeSize(double delta) {
    setState(() {
      _fontSize = (_fontSize + delta).clamp(18, 40);
    });
  }

  @override
  Widget build(BuildContext context) {
    final poem = widget.poem;

    return Scaffold(
      backgroundColor: AppColors.paper,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.paper,
            elevation: 0,
            pinned: true,
            iconTheme: const IconThemeData(color: AppColors.primary),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              tooltip: 'Back',
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              IconButton(
                tooltip: 'چھوٹا حرف',
                onPressed: () => _changeSize(-2),
                icon: const Icon(Icons.text_decrease),
              ),
              IconButton(
                tooltip: 'بڑا حرف',
                onPressed: () => _changeSize(2),
                icon: const Icon(Icons.text_increase),
              ),
            ],
            title: Text(
              widget.chapterTitle,
              style: const TextStyle(
                fontFamily: kNastaleeqFont,
                color: AppColors.primary,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                if (poem.subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      poem.subtitle!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: kNastaleeqFont,
                        fontSize: 16,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                Text(
                  poem.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: kNastaleeqFont,
                    fontSize: _fontSize + 4,
                    color: AppColors.primary,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: Container(
                    height: 1.5,
                    width: 64,
                    decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                for (int i = 0; i < poem.verses.length; i++) ...[
                  _VerseBlock(lines: poem.verses[i], fontSize: _fontSize),
                  if (i != poem.verses.length - 1) const SizedBox(height: 32),
                ],
                if (poem.closingSignature != null) ...[
                  const SizedBox(height: 48),
                  Text(
                    poem.closingSignature!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: kNastaleeqFont,
                      fontSize: _fontSize * 0.7,
                      color: AppColors.inkSoft,
                    ),
                  ),
                ],
              ]),
            ),
          ),
        ],
      ),
    );
  }
}


/// Renders one couplet — one or two misras (lines), each centered.
class _VerseBlock extends StatelessWidget {
  final List<String> lines;
  final double fontSize;

  const _VerseBlock({required this.lines, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final line in lines)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              line,
              textAlign: TextAlign.center,
              style: AppTheme.verseText.copyWith(fontSize: fontSize, height: 1.9),
            ),
          ),
      ],
    );
  }
}
