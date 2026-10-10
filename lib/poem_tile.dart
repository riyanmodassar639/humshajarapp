import 'package:flutter/material.dart';
import 'poem.dart';
import 'app_theme.dart';

/// A tappable row representing one poem inside a chapter's list —
/// shows the poem's opening line as its title.
class PoemTile extends StatelessWidget {
  final Poem poem;
  final VoidCallback onTap;

  const PoemTile({super.key, required this.poem, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cream,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (poem.subtitle != null) ...[
                        Text(
                          poem.subtitle!,
                          style: const TextStyle(
                            fontFamily: kNastaleeqFont,
                            fontSize: 14,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 6),
                      ],
                      Text(
                        poem.preview,
                        style: const TextStyle(
                          fontFamily: kNastaleeqFont,
                          fontSize: 22,
                          color: AppColors.ink,
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.format_list_bulleted, size: 14, color: AppColors.inkSoft.withOpacity(0.6)),
                          const SizedBox(width: 4),
                          Text(
                            '${poem.verses.length} اشعار',
                            style: const TextStyle(
                              fontFamily: kNastaleeqFont,
                              fontSize: 14,
                              color: AppColors.inkSoft,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.06),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_back_ios_new, color: AppColors.primary, size: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

