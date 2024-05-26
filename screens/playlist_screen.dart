import 'package:flutter/material.dart';
import 'package:your_app/constants.dart'; // Импорт вашего файла с константами

class PlaylistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(playlistScreenTitle),
      ),
      body: Center(
        child: ListView(
          children: playlists.map((playlist) {
            return ListTile(
              title: Text(playlist),
              onTap: () {
                // Обработчик нажатия для перехода к выбранному плейлисту
                print('Tapped on $playlist');
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

