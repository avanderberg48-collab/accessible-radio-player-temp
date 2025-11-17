# Build Instructions for Accessible Radio Player

This document provides detailed instructions for building the Android APK from the source code.

## System Requirements

### Operating System
- Windows 10/11
- macOS 10.14 or later
- Linux (Ubuntu 20.04 or later recommended)

### Software Requirements
1. **Flutter SDK 3.38.1 or later**
2. **Java JDK 17**
3. **Android SDK** with:
   - Android SDK Platform 36 (Android 16)
   - Android SDK Build-Tools 34.0.0 or later
   - Android SDK Command-line Tools
4. **Git** (optional, for version control)

## Step-by-Step Installation

### 1. Install Flutter SDK

#### Windows
1. Download Flutter SDK from https://docs.flutter.dev/get-started/install/windows
2. Extract the zip file to `C:\src\flutter`
3. Add Flutter to PATH:
   - Search for "Environment Variables"
   - Edit PATH and add `C:\src\flutter\bin`
4. Verify installation:
   ```cmd
   flutter doctor
   ```

#### macOS
1. Download Flutter SDK from https://docs.flutter.dev/get-started/install/macos
2. Extract to desired location (e.g., `~/development/flutter`)
3. Add to PATH in `~/.zshrc` or `~/.bash_profile`:
   ```bash
   export PATH="$PATH:$HOME/development/flutter/bin"
   ```
4. Reload shell and verify:
   ```bash
   source ~/.zshrc
   flutter doctor
   ```

#### Linux
1. Download Flutter SDK:
   ```bash
   cd ~
   wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.38.1-stable.tar.xz
   tar xf flutter_linux_3.38.1-stable.tar.xz
   ```
2. Add to PATH in `~/.bashrc`:
   ```bash
   export PATH="$PATH:$HOME/flutter/bin"
   ```
3. Reload and verify:
   ```bash
   source ~/.bashrc
   flutter doctor
   ```

### 2. Install Java JDK 17

#### Windows
1. Download from https://adoptium.net/temurin/releases/
2. Install and note the installation path
3. Set JAVA_HOME environment variable to installation path
4. Verify:
   ```cmd
   java -version
   ```

#### macOS
```bash
brew install openjdk@17
sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
```

#### Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install openjdk-17-jdk
java -version
```

### 3. Install Android SDK

#### Option A: Using Android Studio (Recommended)
1. Download Android Studio from https://developer.android.com/studio
2. Install Android Studio
3. Open Android Studio and go to Settings → Appearance & Behavior → System Settings → Android SDK
4. Install:
   - Android SDK Platform 36
   - Android SDK Build-Tools 34.0.0
   - Android SDK Command-line Tools
5. Note the SDK location (e.g., `C:\Users\YourName\AppData\Local\Android\Sdk`)

#### Option B: Command Line Tools Only
1. Download command line tools from https://developer.android.com/studio#command-tools
2. Extract to a directory (e.g., `~/android-sdk`)
3. Create directory structure:
   ```bash
   mkdir -p ~/android-sdk/cmdline-tools
   mv cmdline-tools ~/android-sdk/cmdline-tools/latest
   ```
4. Install required components:
   ```bash
   cd ~/android-sdk/cmdline-tools/latest/bin
   ./sdkmanager "platform-tools" "platforms;android-36" "build-tools;34.0.0"
   ```

### 4. Configure Flutter for Android

1. Set Android SDK path:
   ```bash
   flutter config --android-sdk /path/to/android-sdk
   ```

2. Accept Android licenses:
   ```bash
   flutter doctor --android-licenses
   ```
   Type 'y' to accept all licenses

3. Verify setup:
   ```bash
   flutter doctor
   ```
   All Android-related checks should show ✓

## Building the APK

### 1. Navigate to Project Directory
```bash
cd accessible_radio_player
```

### 2. Get Dependencies
```bash
flutter pub get
```

This downloads all required packages specified in `pubspec.yaml`.

### 3. Build Release APK

#### Standard Build (Universal APK)
```bash
flutter build apk --release
```

Output location: `build/app/outputs/flutter-apk/app-release.apk`
File size: ~50-60 MB

#### Split APKs (Recommended for Distribution)
```bash
flutter build apk --split-per-abi
```

Output location: `build/app/outputs/flutter-apk/`
- `app-armeabi-v7a-release.apk` (~25 MB) - For older 32-bit ARM devices
- `app-arm64-v8a-release.apk` (~25 MB) - For modern 64-bit ARM devices (most common)
- `app-x86_64-release.apk` (~25 MB) - For x86 devices (rare)

**Recommendation**: Distribute `app-arm64-v8a-release.apk` for most users.

### 4. Build Debug APK (for Testing)
```bash
flutter build apk --debug
```

Debug APKs are larger and slower but include debugging information.

## Troubleshooting

### Issue: "Unable to locate Android SDK"
**Solution**: 
```bash
flutter config --android-sdk /path/to/your/android-sdk
```

### Issue: "Android license status unknown"
**Solution**:
```bash
flutter doctor --android-licenses
```

### Issue: "Gradle build failed"
**Solution**:
1. Clean the project:
   ```bash
   flutter clean
   flutter pub get
   ```
2. Verify Java version:
   ```bash
   java -version
   ```
   Should show version 17.x.x

3. Try building again

### Issue: "Execution failed for task ':app:mergeReleaseResources'"
**Solution**:
```bash
cd android
./gradlew clean
cd ..
flutter build apk --release
```

### Issue: Build is very slow
**Solution**:
1. Increase Gradle memory in `android/gradle.properties`:
   ```properties
   org.gradle.jvmargs=-Xmx4096m
   ```
2. Enable Gradle daemon:
   ```properties
   org.gradle.daemon=true
   ```

### Issue: "Unsupported class file major version"
**Solution**: Ensure you're using Java 17, not a newer or older version.

## Signing the APK (Optional)

For production release, you should sign the APK with your own keystore.

### 1. Create a Keystore
```bash
keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

### 2. Configure Signing
Create `android/key.properties`:
```properties
storePassword=<your-store-password>
keyPassword=<your-key-password>
keyAlias=upload
storeFile=/path/to/upload-keystore.jks
```

### 3. Update `android/app/build.gradle.kts`
Add before the `android` block:
```kotlin
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}
```

Update the `android` block to include signing config:
```kotlin
android {
    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String
            keyPassword = keystoreProperties["keyPassword"] as String
            storeFile = file(keystoreProperties["storeFile"] as String)
            storePassword = keystoreProperties["storePassword"] as String
        }
    }
    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
        }
    }
}
```

### 4. Build Signed APK
```bash
flutter build apk --release
```

## Build Times

Typical build times (first build):
- **Windows**: 5-10 minutes
- **macOS**: 4-8 minutes
- **Linux**: 3-7 minutes

Subsequent builds: 1-3 minutes

## APK Size Optimization

Current APK sizes:
- Universal APK: ~50-60 MB
- Split APK (arm64-v8a): ~25 MB

To further reduce size:
1. Use split APKs
2. Enable code shrinking (already enabled in release builds)
3. Remove unused resources
4. Use ProGuard/R8 obfuscation (already enabled)

## Testing the APK

### Install on Physical Device
1. Enable Developer Options on Android device
2. Enable USB Debugging
3. Connect device via USB
4. Install APK:
   ```bash
   flutter install
   ```
   or
   ```bash
   adb install build/app/outputs/flutter-apk/app-release.apk
   ```

### Install on Emulator
1. Start Android emulator:
   ```bash
   flutter emulators --launch <emulator-id>
   ```
2. Install APK:
   ```bash
   flutter install
   ```

## Distribution

### Google Play Store
1. Create a signed release APK
2. Create app listing on Google Play Console
3. Upload APK or use App Bundle:
   ```bash
   flutter build appbundle --release
   ```

### Direct Distribution
1. Share the APK file directly
2. Users must enable "Install from Unknown Sources"
3. Recommend the arm64-v8a split APK for most users

## Additional Resources

- Flutter Documentation: https://docs.flutter.dev/
- Android Developer Guide: https://developer.android.com/guide
- Flutter Build Modes: https://docs.flutter.dev/testing/build-modes

## Support

If you encounter issues not covered here:
1. Run `flutter doctor -v` and check for issues
2. Check Flutter GitHub issues: https://github.com/flutter/flutter/issues
3. Consult Flutter community: https://flutter.dev/community
