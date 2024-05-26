import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../widgets/command_button.dart';

class RemoteControlScreen extends StatefulWidget {
  @override
  _RemoteControlScreenState createState() => _RemoteControlScreenState();
}

class _RemoteControlScreenState extends State<RemoteControlScreen> {
  final WebSocketChannel channel = WebSocketChannel.connect(
    Uri.parse('ws://your-websocket-url'), // Замените на ваш URL WebSocket
  );

  void _sendCommand(String command) {
    channel.sink.add(command);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Karaoke Remote'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CommandButton(
              onPressed: () => _sendCommand('play'),
              text: 'Play',
            ),
            CommandButton(
              onPressed: () => _sendCommand('pause'),
              text: 'Pause',
            ),
            CommandButton(
              onPressed: () => _sendCommand('next'),
              text: 'Next Song',
            ),
            CommandButton(
              onPressed: () => _sendCommand('previous'),
              text: 'Previous Song',
            ),
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  return Text('Response: ${snapshot.data}');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
