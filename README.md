# Accessible Radio Player

A fully accessible Flutter-based Android radio player app with online streaming, station management, and recording capabilities, designed specifically for blind and visually impaired users.

## Features

### 🎵 Radio Streaming
- Play online radio stations via streaming URLs
- Support for various audio formats (MP3, AAC, etc.)
- Background playback support
- Play/Pause/Stop controls

### 📻 Station Management
- Add custom radio stations by name and URL
- View all saved stations in an organized list
- Mark stations as favorites
- Delete unwanted stations
- Persistent storage using SQLite database

### 🎙️ Recording
- Record live radio streams
- Save recordings to device storage
- View and manage all recordings
- Delete recordings when no longer needed
- Recordings saved in M4A format (AAC-LC codec, 128kbps, 44.1kHz)

### ♿ Accessibility Features
- **Text-to-Speech (TTS)** announcements for all actions
- Large, high-contrast UI elements
- Semantic labels for screen readers
- Voice feedback for:
  - Station playback status
  - Recording status
  - Navigation changes
  - Errors and confirmations
- Fully compatible with Android TalkBack

## Technical Specifications

### SDK Configuration
- **Compile SDK**: 36 (Android 16)
- **Target SDK**: 36 (Android 16)
- **Min SDK**: 21 (Android 5.0 Lollipop)
- **Java Version**: 17

### Dependencies
- `just_audio` ^0.9.40 - Audio streaming
- `audio_service` ^0.18.15 - Background audio service
- `record` ^5.1.2 - Audio recording
- `path_provider` ^2.1.4 - File system access
- `permission_handler` ^11.3.1 - Runtime permissions
- `provider` ^6.1.2 - State management
- `shared_preferences` ^2.3.2 - Settings storage
- `sqflite` ^2.3.3+1 - Database
- `flutter_tts` ^4.2.0 - Text-to-speech
- `http` ^1.2.2 - HTTP requests

## Project Structure

```
lib/
├── main.dart                          # App entry point
├── models/
│   └── radio_station.dart            # Radio station data model
├── providers/
│   ├── radio_provider.dart           # Radio state management
│   └── recording_provider.dart       # Recording state management
├── services/
│   ├── audio_player_service.dart     # Audio playback service
│   ├── recording_service.dart        # Recording service
│   ├── database_helper.dart          # SQLite database helper
│   └── accessibility_service.dart    # TTS and accessibility
└── screens/
    ├── home_screen.dart              # Main navigation
    ├── stations_screen.dart          # Station list and management
    ├── player_screen.dart            # Playback controls
    └── recordings_screen.dart        # Recordings list
```

## Building the APK

### Prerequisites
1. Install Flutter SDK (3.38.1 or later)
2. Install Java JDK 17
3. Install Android SDK with the following components:
   - Android SDK Platform 36
   - Android SDK Build-Tools 34.0.0 or later
   - Android SDK Command-line Tools

### Build Steps

1. **Clone or extract the project**
   ```bash
   cd accessible_radio_player
   ```

2. **Get Flutter dependencies**
   ```bash
   flutter pub get
   ```

3. **Build the release APK**
   ```bash
   flutter build apk --release
   ```

4. **Locate the APK**
   The APK will be generated at:
   ```
   build/app/outputs/flutter-apk/app-release.apk
   ```

### Alternative: Build with Split APKs (smaller file size)
```bash
flutter build apk --split-per-abi
```
This creates separate APKs for different CPU architectures:
- `app-armeabi-v7a-release.apk` (32-bit ARM)
- `app-arm64-v8a-release.apk` (64-bit ARM)
- `app-x86_64-release.apk` (64-bit x86)

## Installation

1. Enable "Install from Unknown Sources" on your Android device
2. Transfer the APK to your device
3. Open the APK file and follow installation prompts
4. Grant required permissions:
   - Internet access (for streaming)
   - Microphone (for recording)
   - Storage (for saving recordings)

## Usage Guide

### Adding a Radio Station
1. Open the app and navigate to the "Stations" tab
2. Tap the "+" button (floating action button or top-right icon)
3. Enter the station name (e.g., "BBC Radio 1")
4. Enter the stream URL (e.g., "http://stream.example.com/radio")
5. Tap "Add"
6. The app will announce "Station [name] added successfully"

### Playing a Station
1. In the "Stations" tab, tap on any station in the list
2. The app will start playing and announce "Now playing [station name]"
3. Navigate to the "Player" tab to see playback controls

### Recording a Stream
1. While a station is playing, go to the "Player" tab
2. Tap the record button (red circle icon)
3. The app will announce "Recording started for [station name]"
4. Tap the stop recording button to finish
5. The app will announce "Recording stopped"
6. Find your recording in the "Recordings" tab

### Managing Recordings
1. Navigate to the "Recordings" tab
2. View all saved recordings with file size and date
3. Tap the delete icon to remove a recording
4. Confirm deletion when prompted

## Accessibility Tips

### For Screen Reader Users (TalkBack)
- All buttons have descriptive labels
- The app announces all state changes
- Use swipe gestures to navigate between elements
- Double-tap to activate buttons
- Three-finger swipe to navigate between tabs

### Voice Feedback
The app provides voice announcements for:
- "Now playing [station name]" - when playback starts
- "Playback paused" - when paused
- "Playback stopped" - when stopped
- "Recording started for [station name]" - when recording begins
- "Recording stopped" - when recording ends
- "Station [name] added successfully" - when a station is added
- "Station [name] deleted" - when a station is removed
- "Navigated to [screen] screen" - when switching tabs

## Permissions

### Required Permissions
- **INTERNET** - Stream radio stations
- **WAKE_LOCK** - Keep device awake during playback
- **FOREGROUND_SERVICE** - Background audio playback
- **FOREGROUND_SERVICE_MEDIA_PLAYBACK** - Media playback service
- **RECORD_AUDIO** - Record radio streams
- **WRITE_EXTERNAL_STORAGE** (Android 12 and below) - Save recordings
- **READ_EXTERNAL_STORAGE** (Android 12 and below) - Access recordings
- **READ_MEDIA_AUDIO** (Android 13+) - Access audio files

## Troubleshooting

### Playback Issues
- Verify the stream URL is correct and accessible
- Check internet connection
- Some streams may require specific formats or protocols
- Try a different radio station to isolate the issue

### Recording Issues
- Ensure microphone permission is granted
- Check available storage space
- Recordings are saved in the app's document directory

### Build Issues
- Ensure Flutter SDK is properly installed: `flutter doctor`
- Verify Java 17 is installed: `java -version`
- Clean the build: `flutter clean && flutter pub get`
- Update Flutter: `flutter upgrade`

## Example Radio Stations

Here are some public radio stream URLs you can use to test:

- **SomaFM Groove Salad**: `http://ice1.somafm.com/groovesalad-128-mp3`
- **181.FM The Buzz**: `http://listen.181fm.com/181-buzz_128k.mp3`
- **Radio Swiss Jazz**: `http://stream.srg-ssr.ch/rsj/mp3_128`

*Note: Stream availability may vary by region and time.*

## License

This project is open source and available for personal and educational use.

## Support

For issues or questions about building and using this app, please refer to:
- Flutter documentation: https://docs.flutter.dev/
- Android accessibility: https://support.google.com/accessibility/android

## Version History

### Version 1.0.0 (Initial Release)
- Radio streaming functionality
- Station management (add, delete, favorite)
- Recording capability
- Full accessibility support with TTS
- SQLite database for persistent storage
- Material Design 3 UI
