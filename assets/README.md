# Assets Directory

## Adding Your Logo

To use your Zuum Music logo as the splash screen:

### 1. Flutter App Splash Screen

1. Place your logo file as `logo.png` in this `assets/` directory
2. Recommended size: 512x512px or larger (PNG format with transparency)
3. The logo will automatically appear in the Flutter splash screen

### 2. Android Native Splash Screen

1. Place your logo as `logo.png` in `android/app/src/main/res/drawable/`
2. Or replace the existing `android/app/src/main/res/drawable/logo.xml` with your logo
3. Recommended sizes for Android:
   - `drawable-mdpi`: 48x48px
   - `drawable-hdpi`: 72x72px
   - `drawable-xhdpi`: 96x96px
   - `drawable-xxhdpi`: 144x144px
   - `drawable-xxxhdpi`: 192x192px

### 3. iOS Native Launch Screen

1. Open `ios/Runner.xcworkspace` in Xcode
2. Right-click on the `Runner` folder in the project navigator
3. Select "Add Files to Runner..."
4. Select your `logo.png` file
5. Make sure "Copy items if needed" is checked
6. Open `ios/Runner/Base.lproj/LaunchScreen.storyboard` in Xcode
7. Select the ImageView in the storyboard
8. In the Attributes Inspector, set the Image property to your logo file name

## Current Status

- ✅ Flutter splash screen: Ready (will show fallback if logo.png not found)
- ⚠️ Android native splash: Needs logo.png in drawable folder
- ⚠️ iOS native launch screen: Needs logo added via Xcode

