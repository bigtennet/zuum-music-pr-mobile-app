# Flutter Zuum - WebView Wrapper

A Flutter mobile application that wraps the Zuum Music web application (https://zuummusicpr.com) in a native WebView container for Android and iOS.

## Project Overview

This is a Flutter WebView wrapper for the **Zuum Music** web application (https://www.zuummusicpr.com). The app provides a native mobile experience by embedding the web app in a full-screen WebView with:

- **Splash Screen**: Displays Zuum Music logo on app launch
- **Full-Screen WebView**: No app bars or navigation, just the web content
- **Loading Indicators**: Shows progress while pages load
- **Error Handling**: User-friendly error messages with retry functionality
- **Pull-to-Refresh**: Swipe down to refresh the web content
- **JavaScript Enabled**: Full support for JavaScript in the WebView
- **Clean UI**: Minimal Material Design 3 interface

## Prerequisites

Before building and running this project, ensure you have:

- **Flutter SDK** (3.0.0 or higher) installed and configured
  - Verify installation: `flutter doctor`
- **Android Studio** (for Android development)
  - Android SDK and build tools
  - Android emulator or physical device
- **Xcode** (for iOS development - macOS only)
  - Xcode 12.0 or higher
  - CocoaPods installed: `sudo gem install cocoapods`
  - Apple Developer account (for App Store distribution)

## Getting Started

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Run the App

```bash
flutter run
```

This will launch the app on a connected device or emulator. You can specify a device:

```bash
# List available devices
flutter devices

# Run on a specific device
flutter run -d <device-id>
```

## Configuration

### Web App URL

This app is specifically designed for the **Zuum Music** web application. The URL is configured in `lib/main.dart`:

```dart
// Line 9 in lib/main.dart
const String kWebAppUrl = "https://www.zuummusicpr.com";
```

**Note:** This URL is fixed and should not be changed, as the app is specifically built for the Zuum Music web application.

### Logo Configuration

✅ **Logo is already included!** The Zuum Music logo has been downloaded from the website and is located at `assets/logo.png`.

The splash screen will automatically display this logo when the app launches. If you need to update the logo:

1. **Replace the logo file**:
   - Replace `assets/logo.png` with your new logo
   - Recommended size: 512x512px (PNG with transparency)

2. **For native splash screens** (optional):
   - **Android**: Place logo in `android/app/src/main/res/drawable/`
   - **iOS**: Add logo via Xcode to `LaunchScreen.storyboard`
   - See `assets/README.md` or `LOGO_SETUP.md` for detailed instructions

**Note:** The app includes a fallback UI that shows the app name if the logo fails to load.

## Building for Production

### Android

#### Build APK (for direct installation)

```bash
flutter build apk --release
```

The APK will be generated at: `build/app/outputs/flutter-apk/app-release.apk`

#### Build App Bundle (for Google Play Store)

```bash
flutter build appbundle --release
```

The AAB file will be generated at: `build/app/outputs/bundle/release/app-release.aab`

**Note:** Before uploading to Play Store, you may need to:
1. Update the `applicationId` in `android/app/build.gradle`
2. Configure signing keys for release builds
3. Update app metadata in `AndroidManifest.xml`

### iOS

**Note:** iOS builds require macOS with Xcode installed.

#### Build iOS Release

```bash
flutter build ios --release
```

#### Archive and Upload to App Store

1. Open the iOS project in Xcode:
   ```bash
   open ios/Runner.xcworkspace
   ```

2. In Xcode:
   - Select "Any iOS Device" or a connected device as the build target
   - Go to **Product > Archive**
   - Once archived, the Organizer window will open
   - Click **Distribute App** to upload to App Store Connect

**Note:** Before uploading to App Store, you need to:
1. Update the Bundle Identifier in Xcode (currently `com.example.flutter_zuum`)
2. Configure signing certificates and provisioning profiles
3. Update app metadata in `ios/Runner/Info.plist`
4. Ensure you have an active Apple Developer account

## Project Structure

```
flutter-zuum/
├── android/              # Android-specific configuration
│   ├── app/
│   │   └── src/main/
│   │       ├── AndroidManifest.xml  # Android permissions and app config
│   │       └── kotlin/.../MainActivity.kt
│   └── build.gradle      # Android build configuration
├── ios/                  # iOS-specific configuration
│   └── Runner/
│       ├── Info.plist    # iOS app configuration and ATS settings
│       └── AppDelegate.swift
├── assets/               # App assets
│   ├── logo.png         # Zuum Music logo (already included)
│   └── README.md        # Logo setup instructions
├── lib/
│   ├── main.dart        # Main application entry point
│   └── splash_screen.dart  # Splash screen with logo
├── pubspec.yaml         # Flutter dependencies
├── README.md           # This file
├── LOGO_SETUP.md       # Logo setup guide
├── CHANGES.md          # Change log
└── DEPLOYMENT_CHECKLIST.md  # Pre-deployment checklist
```

## Key Features

- **Splash Screen**: Displays Zuum Music logo for 2 seconds on app launch
- **Full-Screen WebView**: No app bars or navigation, just the web content
- **Loading State**: Circular progress indicator while pages load
- **Error Handling**: User-friendly error messages with retry button
- **Pull-to-Refresh**: Swipe down to refresh the web content
- **JavaScript Enabled**: Full support for JavaScript in the WebView
- **Network Error Detection**: Detects and displays network-related errors
- **Responsive Design**: Works in both portrait and landscape orientations

## Troubleshooting

### Android Issues

- **Build errors**: Ensure Android SDK is properly configured
- **Internet permission**: Already configured in `AndroidManifest.xml`
- **WebView not loading**: Check device internet connection

### iOS Issues

- **App Transport Security**: Configured in `Info.plist` to allow HTTPS connections
- **Build errors**: Run `pod install` in the `ios/` directory
- **Signing issues**: Configure signing in Xcode project settings

### General Issues

- **Dependencies**: Run `flutter pub get` if packages are missing
- **Flutter version**: Ensure you're using Flutter 3.0.0 or higher
- **Clean build**: Try `flutter clean` followed by `flutter pub get` if issues persist

## Development Notes

- **App Name**: "Zuum Music" (configured throughout the project)
- **Web App URL**: `https://www.zuummusicpr.com` (configured in `lib/main.dart`)
- **Theme**: Material Design 3
- **WebView Settings**: Unrestricted JavaScript mode, zoom enabled
- **Error Handling**: Covers network failures and page load errors
- **Orientations**: Supports both portrait and landscape modes

## Quick Start for New Developers

```bash
# 1. Clone the repository
git clone <repository-url>
cd flutter-zuum

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run

# 4. Build for production
flutter build apk --release        # Android
flutter build ios --release         # iOS (macOS only)
```

## Important Notes Before Building for Production

### Android
- Update `applicationId` in `android/app/build.gradle` (currently `com.example.flutter_zuum`)
- Configure signing keys for release builds
- Update app metadata in `AndroidManifest.xml` if needed

### iOS
- Update Bundle Identifier in Xcode (currently `com.example.flutter_zuum`)
- Configure signing certificates and provisioning profiles
- Ensure Apple Developer account is active

## License

This project is a wrapper application. Please ensure you have the necessary rights to distribute the wrapped web application.

## Support

For Flutter-specific issues, refer to:
- [Flutter Documentation](https://flutter.dev/docs)
- [webview_flutter Package](https://pub.dev/packages/webview_flutter)

For web app issues, contact the web application maintainers.

