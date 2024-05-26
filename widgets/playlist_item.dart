import 'package:flutter/material.dart';
import '../models/playlist.dart';
import '../utils/constants.dart';

class PlaylistItem extends StatelessWidget {
  final Playlist playlist;
  final VoidCallback onPressed;

  PlaylistItem({required this.playlist, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 390,
        height: 84,
        padding: EdgeInsets.all(Constants.defaultPadding),
        decoration: BoxDecoration(
          gradient: Constants.primaryGradient,
          border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  playlist.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 4),
                Text(
                  '${playlist.songCount} songs',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
