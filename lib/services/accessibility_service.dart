import 'package:flutter_tts/flutter_tts.dart';

class AccessibilityService {
  static final AccessibilityService instance = AccessibilityService._init();
  late FlutterTts _flutterTts;
  bool _isEnabled = true;

  AccessibilityService._init() {
    _flutterTts = FlutterTts();
    _initTts();
  }

  Future<void> _initTts() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.0);
  }

  bool get isEnabled => _isEnabled;

  void setEnabled(bool enabled) {
    _isEnabled = enabled;
  }

  Future<void> speak(String text) async {
    if (_isEnabled && text.isNotEmpty) {
      await _flutterTts.speak(text);
    }
  }

  Future<void> stop() async {
    await _flutterTts.stop();
  }

  Future<void> announceStationPlaying(String stationName) async {
    await speak('Now playing $stationName');
  }

  Future<void> announceStationPaused() async {
    await speak('Playback paused');
  }

  Future<void> announceStationStopped() async {
    await speak('Playback stopped');
  }

  Future<void> announceRecordingStarted(String stationName) async {
    await speak('Recording started for $stationName');
  }

  Future<void> announceRecordingStopped() async {
    await speak('Recording stopped');
  }

  Future<void> announceStationAdded(String stationName) async {
    await speak('Station $stationName added successfully');
  }

  Future<void> announceStationDeleted(String stationName) async {
    await speak('Station $stationName deleted');
  }

  Future<void> announceError(String error) async {
    await speak('Error: $error');
  }

  Future<void> announceNavigationChange(String screenName) async {
    await speak('Navigated to $screenName screen');
  }
}
