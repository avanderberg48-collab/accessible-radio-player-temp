import 'dart:io';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class RecordingService {
  static final RecordingService instance = RecordingService._init();
  late AudioRecorder _recorder;
  bool _isRecording = false;
  String? _currentRecordingPath;

  RecordingService._init() {
    _recorder = AudioRecorder();
  }

  bool get isRecording => _isRecording;
  String? get currentRecordingPath => _currentRecordingPath;

  Future<bool> checkPermissions() async {
    final status = await Permission.microphone.status;
    if (status.isDenied) {
      final result = await Permission.microphone.request();
      return result.isGranted;
    }
    return status.isGranted;
  }

  Future<void> startRecording(String stationName) async {
    if (_isRecording) {
      throw Exception('Already recording');
    }

    final hasPermission = await checkPermissions();
    if (!hasPermission) {
      throw Exception('Microphone permission denied');
    }

    try {
      final directory = await getApplicationDocumentsDirectory();
      final recordingsDir = Directory('${directory.path}/recordings');
      if (!await recordingsDir.exists()) {
        await recordingsDir.create(recursive: true);
      }

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName = '${stationName.replaceAll(RegExp(r'[^\w\s-]'), '')}_$timestamp.m4a';
      _currentRecordingPath = '${recordingsDir.path}/$fileName';

      await _recorder.start(
        const RecordConfig(
          encoder: AudioEncoder.aacLc,
          bitRate: 128000,
          sampleRate: 44100,
        ),
        path: _currentRecordingPath!,
      );

      _isRecording = true;
    } catch (e) {
      throw Exception('Failed to start recording: $e');
    }
  }

  Future<String?> stopRecording() async {
    if (!_isRecording) {
      return null;
    }

    try {
      final path = await _recorder.stop();
      _isRecording = false;
      final recordedPath = _currentRecordingPath;
      _currentRecordingPath = null;
      return recordedPath;
    } catch (e) {
      throw Exception('Failed to stop recording: $e');
    }
  }

  Future<List<FileSystemEntity>> getRecordings() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final recordingsDir = Directory('${directory.path}/recordings');
      
      if (!await recordingsDir.exists()) {
        return [];
      }

      final files = recordingsDir.listSync();
      files.sort((a, b) => b.statSync().modified.compareTo(a.statSync().modified));
      return files;
    } catch (e) {
      return [];
    }
  }

  Future<void> deleteRecording(String path) async {
    try {
      final file = File(path);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      throw Exception('Failed to delete recording: $e');
    }
  }

  void dispose() {
    _recorder.dispose();
  }
}
