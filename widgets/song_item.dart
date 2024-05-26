import 'package:flutter/material.dart';
import '../models/song.dart';

class Song {
  final String title;
  final String artist;

  Song({required this.title, required this.artist});
}

class SongItem extends StatelessWidget {
  final Song song;

  SongItem({required this.song});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(song.title),
      subtitle: Text(song.artist),
      onTap: () {
        // Добавьте действие при нажатии на песню, например, воспроизведение
      },
    );
  }
}

class SongList extends StatelessWidget {
  final List<Song> songs = [
    Song(title: 'Song 1', artist: 'Artist 1'),
    Song(title: 'Song 2', artist: 'Artist 2'),
    Song(title: 'Song 3', artist: 'Artist 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Songs'),
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return SongItem(song: songs[index]);
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SongList(),
  ));
}
