import 'package:flutter/material.dart';
import '../services/audio_service.dart';
import '../widgets/command_button.dart';


class PlayScreen extends StatelessWidget {
  final AudioService audioService;

  const PlayScreen({Key? key, required this.audioService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Music'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CommandButton(
              onPressed: () => audioService.play().catchError((error) {
                print(error);
              }),
              text: 'Play',
            ),
            CommandButton(
              onPressed: () => audioService.pause().catchError((error) {
                print(error);
              }),
              text: 'Pause',
            ),
            CommandButton(
              onPressed: () => audioService.nextSong().catchError((error) {
                print(error);
              }),
              text: 'Next Song',
            ),
            CommandButton(
              onPressed: () => audioService.previousSong().catchError((error) {
                print(error);
              }),
              text: 'Previous Song',
            ),
          ],
        ),
      ),
    );
  }
}
