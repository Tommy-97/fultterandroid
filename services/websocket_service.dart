import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import '../utils/constants.dart';

class WebSocketService {
  late WebSocketChannel channel;

  void connect() {
    channel = WebSocketChannel.connect(
      Uri.parse(Constants.websocketUrl),
    );
  }

  void sendCommand(String command) {
    channel.sink.add(command);
  }

  Stream get stream => channel.stream;

  void dispose() {
    channel.sink.close(status.goingAway);
  }
}
