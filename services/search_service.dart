import '../models/song.dart';

class SearchService {
  Future<List<Song>> searchSongs(String query) async {
    // Пример заглушки, замените реальной логикой поиска
    await Future.delayed(Duration(seconds: 2)); // Имитируем задержку сети

    // Пример данных
    List<Song> results = [
      Song(title: 'Song 1', artist: 'Artist 1'),
      Song(title: 'Song 2', artist: 'Artist 2'),
    ];

    return results.where((song) => song.title.contains(query) || song.artist.contains(query)).toList();
  }
}
