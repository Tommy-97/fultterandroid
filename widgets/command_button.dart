import 'package:flutter/material.dart';

class CommandButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  CommandButton({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class CommandButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Command Button Example'),
      ),
      body: Center(
        child: CommandButton(
          onPressed: () {
            // Действие при нажатии на кнопку
            print('Button pressed!');
          },
          text: 'Press Me',
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CommandButtonExample(),
  ));
}



