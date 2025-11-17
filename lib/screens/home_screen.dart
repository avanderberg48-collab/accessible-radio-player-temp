import 'package:flutter/material.dart';
import '../services/accessibility_service.dart';
import 'stations_screen.dart';
import 'player_screen.dart';
import 'recordings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final AccessibilityService _accessibilityService = AccessibilityService.instance;

  final List<Widget> _screens = [
    const StationsScreen(),
    const PlayerScreen(),
    const RecordingsScreen(),
  ];

  final List<String> _screenNames = [
    'Stations',
    'Player',
    'Recordings',
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _accessibilityService.announceNavigationChange(_screenNames[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.radio, semanticLabel: 'Stations tab'),
            label: 'Stations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle, semanticLabel: 'Player tab'),
            label: 'Player',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic, semanticLabel: 'Recordings tab'),
            label: 'Recordings',
          ),
        ],
      ),
    );
  }
}
