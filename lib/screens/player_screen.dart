import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/radio_provider.dart';
import '../providers/recording_provider.dart';
import '../services/accessibility_service.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accessibilityService = AccessibilityService.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing'),
      ),
      body: Consumer2<RadioProvider, RecordingProvider>(
        builder: (context, radioProvider, recordingProvider, child) {
          final currentStation = radioProvider.currentStation;

          if (currentStation == null) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.music_off, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No station playing',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Select a station from the Stations tab',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Station icon
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.radio,
                      size: 100,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // Station name
                  Text(
                    currentStation.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  
                  // Station URL
                  Text(
                    currentStation.url,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 48),
                  
                  // Playback controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Stop button
                      IconButton(
                        iconSize: 48,
                        icon: const Icon(Icons.stop),
                        tooltip: 'Stop playback',
                        onPressed: () async {
                          await radioProvider.stop();
                          accessibilityService.announceStationStopped();
                        },
                      ),
                      const SizedBox(width: 24),
                      
                      // Play/Pause button
                      IconButton(
                        iconSize: 72,
                        icon: Icon(
                          radioProvider.isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                        ),
                        tooltip: radioProvider.isPlaying ? 'Pause' : 'Play',
                        onPressed: () async {
                          if (radioProvider.isPlaying) {
                            await radioProvider.pause();
                            accessibilityService.announceStationPaused();
                          } else {
                            await radioProvider.resume();
                            accessibilityService.announceStationPlaying(currentStation.name);
                          }
                        },
                      ),
                      const SizedBox(width: 24),
                      
                      // Record button
                      IconButton(
                        iconSize: 48,
                        icon: Icon(
                          recordingProvider.isRecording ? Icons.stop_circle : Icons.fiber_manual_record,
                          color: recordingProvider.isRecording ? Colors.red : Colors.grey,
                        ),
                        tooltip: recordingProvider.isRecording ? 'Stop recording' : 'Start recording',
                        onPressed: () async {
                          if (recordingProvider.isRecording) {
                            await recordingProvider.stopRecording();
                            accessibilityService.announceRecordingStopped();
                          } else {
                            await recordingProvider.startRecording(currentStation.name);
                            accessibilityService.announceRecordingStarted(currentStation.name);
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // Recording indicator
                  if (recordingProvider.isRecording)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.fiber_manual_record, color: Colors.red, size: 16),
                          SizedBox(width: 8),
                          Text(
                            'Recording in progress',
                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
