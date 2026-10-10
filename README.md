# Hum Shajar (ہم شجر) — Flutter app

A Flutter app for the Urdu poetry book **"Hum Shajar"** by Haris Bilal.
The poetry lives directly in the app as native Urdu text (no PDF is
bundled or displayed), rendered in the Jameel Noori Nastaleeq font.

## Project structure

Every Dart file lives directly under `lib/` (flat, no subfolders) so
imports are always just a filename — no `../` paths to break if you
move things around:

```
lib/
  main.dart          → app entry point, RTL + theme setup
  app_theme.dart      → colors + text styles (cover-inspired palette)
  poem.dart           → Poem & Chapter data classes
  book_data.dart      → the book's actual content, by chapter
  home_screen.dart    → landing page (cover art + chapter list)
  chapter_screen.dart → list of poems inside one chapter
  poem_screen.dart    → full poem reading view, adjustable text size
  chapter_card.dart   → chapter tile used on the landing page
  poem_tile.dart      → poem row used inside a chapter list
assets/
  fonts/              → put JameelNooriNastaleeq.ttf here (see FONT_SETUP.md)
  images/             → optional: a real cover photo, if you want
                         to swap out the painted tree hero
```

## Running it

```bash
flutter pub get
flutter run
```

Read **FONT_SETUP.md** first — the font file has to be added manually.

## Content status — what's transcribed so far

The original PDF has no extractable text (it was exported from
CorelDRAW with every line outlined as curves), so every verse in
`lib/book_data.dart` was transcribed by reading the scanned pages
directly. So far that covers:

- Both Naats (نعت)
- The Salam (سلام)
- Ghazals 1–18 (book pages ~23 to ~55)

Still to add: the foreword's full prose text, and roughly 34 more
ghazals (the book runs to about 139 pages / ~52 ghazals total).

One small transcription note: in ghazal 13 ("میں باہیں کھول بھی
دوں...") two words were hard to make out at that resolution — "باہیں"
and "مٹی" — transcribed as the most contextually sound reading. Worth
double-checking against the print copy if you have one.

### How to add a new poem

Open `lib/book_data.dart` and add another `Poem(...)` entry to
the relevant chapter's `poems` list:

```dart
Poem(
  id: 'ghazal_5',                 // unique, no spaces
  title: 'پہلا مصرع یہاں لکھیں',   // shown as the list title
  verses: const [
    ['پہلا مصرع', 'دوسرا مصرع'],  // one couplet
    ['پہلا مصرع', 'دوسرا مصرع'],  // next couplet
  ],
),
```

That's it — no other file needs to change. The home page, chapter
list, and reading screen all pull from this one list automatically.

## Design notes

- The whole app runs right-to-left (`Directionality` is forced to RTL
  in `main.dart`) since the entire book is Urdu.
- The landing page's tree is drawn with `CustomPainter` (no image
  asset needed) to echo the misty tree-at-sunrise cover art. Swap it
  for `Image.asset('assets/images/cover.jpg')` in `home_screen.dart`
  if you'd rather use a real photo — just add the file under
  `assets/images/`.
- Chapters mirror the book's own "ترتیب" contents page exactly:
  پیشِ لفظ (Foreword) → نعت و سلام (Naat & Salam) → غزل (Ghazal).
- The reading screen has an A+/A- control in the app bar so users can
  size Nastaleeq text to their comfort — small Nastaleeq can be hard
  to read on phone screens, so this matters more than it would for a
  Latin-script app.

## Publishing checklist (Play Store / App Store)

- [ ] Confirm the font's commercial-use license (see FONT_SETUP.md)
- [ ] Add a real app icon (currently uses Flutter's default)
- [ ] Fill in the remaining ghazals + foreword text
- [ ] Set your actual `applicationId` / bundle identifier
- [ ] Add a privacy policy URL if the app will collect any data
      (this starter has no analytics or network calls at all)
