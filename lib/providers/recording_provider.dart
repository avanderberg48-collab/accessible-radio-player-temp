import 'dart:io';
import 'package:flutter/foundation.dart';
import '../services/recording_service.dart';

class RecordingProvider with ChangeNotifier {
  final RecordingService _recordingService = RecordingService.instance;
  
  bool _isRecording = false;
  List<FileSystemEntity> _recordings = [];
  String? _errorMessage;

  bool get isRecording => _isRecording;
  List<FileSystemEntity> get recordings => _recordings;
  String? get errorMessage => _errorMessage;

  RecordingProvider() {
    loadRecordings();
  }

  Future<void> loadRecordings() async {
    try {
      _recordings = await _recordingService.getRecordings();
      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to load recordings: $e';
      notifyListeners();
    }
  }

  Future<void> startRecording(String stationName) async {
    try {
      await _recordingService.startRecording(stationName);
      _isRecording = true;
      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to start recording: $e';
      notifyListeners();
    }
  }

  Future<void> stopRecording() async {
    try {
      await _recordingService.stopRecording();
      _isRecording = false;
      await loadRecordings();
      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to stop recording: $e';
      notifyListeners();
    }
  }

  Future<void> deleteRecording(String path) async {
    try {
      await _recordingService.deleteRecording(path);
      await loadRecordings();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Failed to delete recording: $e';
      notifyListeners();
    }
  }
}
