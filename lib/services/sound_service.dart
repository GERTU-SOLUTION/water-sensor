import 'dart:html' as html;

class SoundService {
  final html.AudioElement _player = html.AudioElement(
    'assets/alert_notification.mp3',
  )..loop = true;
  bool _isPlaying = false;
  void start() {
    if (_isPlaying) return;

    _player.currentTime = 0;
    _player
        .play()
        .then((_) {
          _isPlaying = true;
          print('🔊 sound started');
        })
        .catchError((e) {
          print('🔇 sound play error: $e');
        });
  }

  void stop() {
    if (!_isPlaying) return;

    _player.pause();
    _player.currentTime = 0;
    _isPlaying = false;
    print('🔕 sound stopped');
  }
}

final soundService = SoundService();
