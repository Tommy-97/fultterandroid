import 'package:flutter/material.dart';

class Constants {
  // Цвета
  static const Color primaryColor = Colors.blue;
  static const Color accentColor = Colors.green;

  // Размеры
  static const double defaultPadding = 16.0;
  static const double borderRadius = 8.0;

  // Строки
  static const String appName = 'Karaoke Remote';

  // Шрифты
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  // API URL
  static const String apiUrl = 'https://api.example.com';
  static const String websocketUrl = 'ws://your-websocket-url';
}
