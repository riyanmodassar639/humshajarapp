# Setting up Jameel Noori Nastaleeq

The app is already wired up to use a font family called
`JameelNooriNastaleeq` everywhere (see `lib/theme/app_theme.dart` and
`pubspec.yaml`). You just need to drop the real font file in place —
it isn't included here because font files are separately licensed and
shouldn't be redistributed inside someone else's project/repo.

## 1. Download the font

Jameel Noori Nastaleeq is freely distributed for personal/educational
use. Two reliable sources:

- https://jameelnoori.com/ (the font's own site)
- https://urdufonts.com/fonts/jameel-noori-nastaleeq (mirror, cited by
  Wikipedia as the official free-download source)

Download the **.ttf** file (not .otf) — Flutter embeds TrueType fonts
most reliably on both Android and iOS.

> Before you ship the app to the Play Store / App Store, double check
> the license text on whichever site you download from — "free for
> personal/educational use" is not automatically the same as "free to
> bundle inside a commercial app." If you plan to sell the app or the
> book, it's worth emailing the foundry to confirm commercial use, or
> budgeting for a small licensing fee.

## 2. Place the file

Rename it exactly to:

```
assets/fonts/JameelNooriNastaleeq.ttf
```

(the folder `assets/fonts/` already exists in this project — just
copy the file in).

## 3. Confirm pubspec.yaml

`pubspec.yaml` already contains this block — no change needed unless
your filename differs:

```yaml
flutter:
  fonts:
    - family: JameelNooriNastaleeq
      fonts:
        - asset: assets/fonts/JameelNooriNastaleeq.ttf
```

## 4. Get packages and run

```bash
flutter pub get
flutter run
```

If the app still shows a fallback font after this, check:
- The file is really a `.ttf`/`.otf` (not an `.html` download page
  saved by mistake — a common gotcha with some font sites).
- The path/case in `pubspec.yaml` matches the actual file exactly
  (case-sensitive on Android builds).
- Run `flutter clean && flutter pub get` once after adding a new font.
