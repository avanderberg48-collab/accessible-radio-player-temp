import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/radio_provider.dart';
import 'providers/recording_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RadioProvider()),
        ChangeNotifierProvider(create: (_) => RecordingProvider()),
      ],
      child: MaterialApp(
        title: 'Accessible Radio Player',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          // High contrast for better visibility
          brightness: Brightness.light,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 18),
            bodyMedium: TextStyle(fontSize: 16),
            titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
