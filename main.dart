import 'package:flutter/material.dart';
import 'screens/song_list.dart';
import 'utils/constants.dart';

void main() {
  runApp(KaraokeRemoteApp());
}

class KaraokeRemoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: SongList(),
    );
  }
}
