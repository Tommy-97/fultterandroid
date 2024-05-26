import 'package:flutter/material.dart';

class Constants {
  // Colors
  static const Color primaryColor = Color(0xFF181818);
  static const Color secondaryColor = Color(0xFF0F0F0F);
  static const Color accentColor = Colors.green;

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColor, secondaryColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Padding and Margins
  static const double defaultPadding = 16.0;
  static const double borderRadius = 8.0;

  // Text Styles
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  // Strings
  static const String appName = 'Karaoke Remote';

  // API URLs
  static const String apiUrl = 'https://api.example.com';
  static const String websocketUrl = 'ws://your-websocket-url';
}
