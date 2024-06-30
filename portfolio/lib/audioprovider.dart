import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class AudioProvider with ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  AudioProvider() {
    _audioPlayer.setSourceAsset('u-said-it-v13-1167(high bitrate).mp3');
  }

  bool get isPlaying => _isPlaying;

  void togglePlayPause() {
    if (_isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.resume();
    }
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
