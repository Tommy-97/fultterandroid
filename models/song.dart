class Song {
  final String title;
  final String artist;
  final String album;
  final String duration;
  final String imageUrl;
  final String audioUrl;

  Song({
    required this.title,
    required this.artist,
    required this.album,
    required this.duration,
    required this.imageUrl,
    required this.audioUrl,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      title: json['title'],
      artist: json['artist'],
      album: json['album'],
      duration: json['duration'],
      imageUrl: json['imageUrl'],
      audioUrl: json['audioUrl'],
    );
  }
}

class required {}
