import 'song.dart';

class Song {
  final int id;
  final String title;
  final String author;

  Song({
    required this.id,
    required this.title,
    required this.author,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'],
      title: json['title'],
      author: json['author'],
    );
  }
}
