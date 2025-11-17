import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import '../models/radio_station.dart';
import '../services/database_helper.dart';
import '../services/audio_player_service.dart';

class RadioProvider with ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  final AudioPlayerService _audioService = AudioPlayerService.instance;
  
  List<RadioStation> _stations = [];
  RadioStation? _currentStation;
  bool _isPlaying = false;
  bool _isLoading = false;
  String? _errorMessage;

  List<RadioStation> get stations => _stations;
  RadioStation? get currentStation => _currentStation;
  bool get isPlaying => _isPlaying;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  RadioProvider() {
    _init();
  }

  void _init() {
    loadStations();
    _audioService.playerStateStream.listen((state) {
      _isPlaying = state.playing;
      notifyListeners();
    });
  }

  Future<void> loadStations() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      _stations = await _dbHelper.getAllStations();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Failed to load stations: $e';
    }
    
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addStation(String name, String url) async {
    try {
      final station = RadioStation(name: name, url: url);
      final id = await _dbHelper.insertStation(station);
      await loadStations();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Failed to add station: $e';
      notifyListeners();
    }
  }

  Future<void> deleteStation(int id) async {
    try {
      await _dbHelper.deleteStation(id);
      await loadStations();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Failed to delete station: $e';
      notifyListeners();
    }
  }

  Future<void> toggleFavorite(RadioStation station) async {
    try {
      final updatedStation = station.copyWith(isFavorite: !station.isFavorite);
      await _dbHelper.updateStation(updatedStation);
      await loadStations();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Failed to update favorite: $e';
      notifyListeners();
    }
  }

  Future<void> playStation(RadioStation station) async {
    try {
      await _audioService.playStation(station);
      _currentStation = station;
      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to play station: $e';
      notifyListeners();
    }
  }

  Future<void> pause() async {
    await _audioService.pause();
    notifyListeners();
  }

  Future<void> resume() async {
    await _audioService.resume();
    notifyListeners();
  }

  Future<void> stop() async {
    await _audioService.stop();
    _currentStation = null;
    notifyListeners();
  }
}
