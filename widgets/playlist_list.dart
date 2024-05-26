import 'package:flutter/material.dart';
import '../models/playlist.dart';
import '../widgets/playlist_item.dart';
import '../utils/constants.dart';

class PlaylistList extends StatelessWidget {
  final List<Playlist> playlists = [
    Playlist(title: 'My Playlist 1', songCount: 20),
    Playlist(title: 'My Playlist 2', songCount: 15),
    Playlist(title: 'My Playlist 3', songCount: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appName),
        backgroundColor: Constants.primaryColor,
      ),
      body: ListView.builder(
        itemCount: playlists.length,
        itemBuilder: (context, index) {
          return PlaylistItem(
            playlist: playlists[index],
            onPressed: () {
              print('Selected playlist: ${playlists[index].title}');
            },
          );
        },
      ),
    );
  }
}
