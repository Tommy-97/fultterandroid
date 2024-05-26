import 'package:flutter/material.dart';
import 'package:your_app/api_service.dart';
import 'package:your_app/user.dart';
import 'package:your_app/song.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<User> users = [];
  List<Song> songs = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final userList = await ApiService.fetchUsers();
      final songList = await ApiService.fetchSongs();
      setState(() {
        users = userList;
        songs = songList;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users & Songs'),
      ),
      body: Container(
        width: double.infinity, 
        padding: EdgeInsets.all(16), // Добавляем отступы для пробелов
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Users:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(users[index].username),
                    subtitle: Text(users[index].email),
                  );
                },
              ),
            ),
            Text('Songs:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(songs[index].title),
                    subtitle: Text(songs[index].author),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
