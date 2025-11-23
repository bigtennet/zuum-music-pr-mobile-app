# Logo Setup Guide

This guide explains how to add your Zuum Music logo to the app for the splash screen.

## Quick Setup (Flutter Splash Screen)

The easiest way is to add your logo to the Flutter app:

1. **Get your logo** from https://zuummusicpr.com
   - Right-click on the logo on the website
   - Save it as `logo.png`
   - Recommended: 512x512px or larger, PNG format with transparency

2. **Place the logo** in the `assets/` directory:
   ```
   assets/logo.png
   ```

3. **That's it!** The Flutter splash screen will automatically use your logo.

## Complete Setup (Native Splash Screens)

For the best experience, you can also add the logo to native splash screens:

### Android

1. Place `logo.png` in `android/app/src/main/res/drawable/`
2. Or create different sizes for different screen densities:
   - `drawable-mdpi/logo.png` (48x48px)
   - `drawable-hdpi/logo.png` (72x72px)
   - `drawable-xhdpi/logo.png` (96x96px)
   - `drawable-xxhdpi/logo.png` (144x144px)
   - `drawable-xxxhdpi/logo.png` (192x192px)

### iOS

1. Open `ios/Runner.xcworkspace` in Xcode
2. Right-click on the `Runner` folder → "Add Files to Runner..."
3. Select your `logo.png` file
4. Check "Copy items if needed"
5. Open `ios/Runner/Base.lproj/LaunchScreen.storyboard` in Xcode
6. Select the ImageView
7. In Attributes Inspector, set Image to your logo file name

## Testing

After adding the logo:

```bash
flutter clean
flutter pub get
flutter run
```

You should see your logo on the splash screen!

## Fallback

If no logo is found, the app will show a fallback icon with "Zuum Music" text, so the app will work even without a logo file.

