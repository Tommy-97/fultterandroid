import 'package:flutter/material.dart';
import '../models/song.dart';
import '../widgets/song_item.dart';
import '../utils/constants.dart';

class SongList extends StatelessWidget {
  final List<Song> songs = [
    Song(
      title: 'Song 1',
      artist: 'Artist 1',
      album: 'Album 1',
      duration: '3:45',
      imageUrl: 'https://example.com/image1.jpg',
      audioUrl: 'https://example.com/audio1.mp3',
    ),
    Song(
      title: 'Song 2',
      artist: 'Artist 2',
      album: 'Album 2',
      duration: '4:20',
      imageUrl: 'https://example.com/image2.jpg',
      audioUrl: 'https://example.com/audio2.mp3',
    ),
    Song(
      title: 'Song 3',
      artist: 'Artist 3',
      album: 'Album 3',
      duration: '2:50',
      imageUrl: 'https://example.com/image3.jpg',
      audioUrl: 'https://example.com/audio3.mp3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Songs'),
        backgroundColor: Constants.primaryColor,
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
