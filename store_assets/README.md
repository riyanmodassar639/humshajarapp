# ہم شجر (Hum Shajar) — Store & Branding Assets

This directory contains the official production assets for Play Store, App Store, and marketing:

### 1. Google Play Store
- **File**: `play_store_512x512.png`
- **Resolution**: 512 × 512 px
- **Format**: 32-bit PNG (RGB)
- **Max file size**: Under 1024 KB
- **Usage**: Upload directly to Google Play Console under **Main store listing → App icon**.

### 2. Apple App Store
- **File**: `app_store_1024x1024.png`
- **Resolution**: 1024 × 1024 px
- **Format**: PNG, 72 dpi, RGB
- **Usage**: Automatically bundled with iOS build (`ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-1024x1024@1x.png`), and can also be uploaded in App Store Connect under **App Store Icon**.

### 3. Application Launcher Icons (Generated & Ready)
- **Android**: All mipmap folders in `android/app/src/main/res/mipmap-*/ic_launcher.png`
- **iOS**: All device sizes in `ios/Runner/Assets.xcassets/AppIcon.appiconset/`
- **Web**: Favicon and PWA icons in `web/favicon.png` and `web/icons/`
- **Social Sharing (OpenGraph)**: `web/og-image.jpg` configured with meta tags for WhatsApp, Facebook, and Twitter link previews.
