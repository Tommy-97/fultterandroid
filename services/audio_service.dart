import 'package:just_audio/just_audio.dart';

class AudioService {
  late AudioPlayer _audioPlayer;

  AudioService() {
    _audioPlayer = AudioPlayer();
  }

  Future<void> play(String url) async {
    try {
      await _audioPlayer.setUrl(url);
      await _audioPlayer.play();
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }
  
  Future<void> nextSong() async {
    try {
      // Получаем информацию о текущем плейлисте
      final playlist = _audioPlayer.sequence;

      // Получаем текущий индекс воспроизведения
      final currentIndex = _audioPlayer.currentIndex;

      // Проверяем, есть ли следующая песня в плейлисте
      if (playlist != null && currentIndex != null && currentIndex + 1 < playlist.length) {
        // Устанавливаем индекс следующей песни
        await _audioPlayer.seekToNext();
      }
    } catch (e) {
      print('Error switching to next song: $e');
    }
  }

Future<void> previousSong() async {
  try {
    // Получаем информацию о текущем плейлисте
    final playlist = _audioPlayer.sequence;

    // Получаем текущий индекс воспроизведения
    final currentIndex = _audioPlayer.currentIndex;

    // Проверяем, есть ли предыдущая песня в плейлисте
    if (playlist != null && currentIndex != null && currentIndex - 1 >= 0) {
      // Устанавливаем индекс предыдущей песни
      await _audioPlayer.seekToPrevious();
    }
  } catch (e) {
    print('Error switching to previous song: $e');
  }
}
