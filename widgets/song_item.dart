import 'package:flutter/material.dart';
import '../models/song.dart';
import '../utils/constants.dart';

class SongItem extends StatelessWidget {
  final Song song;

  SongItem({required this.song});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(song.imageUrl),
      title: Text(
        song.title,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            song.artist,
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            song.album,
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            song.duration,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
      onTap: () {
      },
    );
  }
}
