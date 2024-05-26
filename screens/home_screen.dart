import 'package:flutter/material.dart';
import 'play_screen.dart';
import 'search_screen.dart';
import 'playlist_screen.dart';
import 'settings_screen.dart';

const Color primaryColor = Colors.blue;
const Color secondaryColor = Colors.white;
const Color accentColor = Colors.amber;

const TextStyle appBarTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: secondaryColor,
);

const TextStyle tabLabelTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: secondaryColor,
);

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    PlayScreen(),
    SearchScreen(),
    PlaylistScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Karaoke Remote', style: appBarTextStyle),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, 
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow, color: accentColor),
            label: Text('Play', style: tabLabelTextStyle),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: accentColor),
            label: Text('Search', style: tabLabelTextStyle),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_play, color: accentColor),
            label: Text('Playlists', style: tabLabelTextStyle),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: accentColor),
            label: Text('Settings', style: tabLabelTextStyle),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
