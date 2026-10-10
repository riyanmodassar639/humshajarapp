/// A single poem (a Naat, a Salam, a Ghazal, or a prose section like the
/// foreword). Poetry is stored as a list of "verses" — for a ghazal each
/// verse is a two-line couplet (sher); for a prose section like the
/// foreword, store the whole paragraph as a single-line "verse".
class Poem {
  final String id;
  final String title;
  final String? subtitle;
  final List<List<String>> verses;
  final String? closingSignature;

  const Poem({
    required this.id,
    required this.title,
    required this.verses,
    this.subtitle,
    this.closingSignature,
  });

  /// A short preview line used in list views (first line of the poem).
  String get preview => verses.isNotEmpty && verses.first.isNotEmpty
      ? verses.first.first
      : title;
}

/// A chapter/section groups related poems together, e.g. "نعت و سلام"
/// (Naat & Salam) or "غزل" (Ghazal).
class Chapter {
  final String id;
  final String titleUrdu;
  final String titleEnglish;
  final String description;
  final List<Poem> poems;

  const Chapter({
    required this.id,
    required this.titleUrdu,
    required this.titleEnglish,
    required this.description,
    required this.poems,
  });
}
