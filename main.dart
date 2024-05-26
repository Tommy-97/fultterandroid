import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/playlist_list.dart';

void main() {
  runApp(KaraokeRemoteApp());
}

class KaraokeRemoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Здесь вы можете выбрать, какой экран отображать при запуске приложения
    bool showHomeScreen = true;

    return MaterialApp(
      title: 'Karaoke Remote',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: showHomeScreen ? HomeScreen() : PlaylistList(),
    );
  }
}
