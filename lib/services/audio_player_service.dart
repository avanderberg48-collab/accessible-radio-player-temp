import 'package:just_audio/just_audio.dart';
import 'package:audio_service/audio_service.dart';
import '../models/radio_station.dart';

class AudioPlayerService {
  static final AudioPlayerService instance = AudioPlayerService._init();
  late AudioPlayer _audioPlayer;
  RadioStation? _currentStation;
  
  AudioPlayerService._init() {
    _audioPlayer = AudioPlayer();
  }

  AudioPlayer get audioPlayer => _audioPlayer;
  RadioStation? get currentStation => _currentStation;

  Stream<PlayerState> get playerStateStream => _audioPlayer.playerStateStream;
  Stream<Duration> get positionStream => _audioPlayer.positionStream;

  Future<void> playStation(RadioStation station) async {
    try {
      _currentStation = station;
      await _audioPlayer.setUrl(station.url);
      await _audioPlayer.play();
    } catch (e) {
      throw Exception('Failed to play radio station: $e');
    }
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  Future<void> resume() async {
    await _audioPlayer.play();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    _currentStation = null;
  }

  bool get isPlaying => _audioPlayer.playing;

  Future<void> dispose() async {
    await _audioPlayer.dispose();
  }
}
