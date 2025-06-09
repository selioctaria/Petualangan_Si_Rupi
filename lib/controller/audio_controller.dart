import 'package:audioplayers/audioplayers.dart';

class AudioController {
  static final AudioController _instance = AudioController._internal();
  factory AudioController() => _instance;
  AudioController._internal();

  final AudioPlayer _bgmPlayer = AudioPlayer()..setReleaseMode(ReleaseMode.loop);
  final AudioPlayer _sfxPlayer = AudioPlayer();

  bool _musicEnabled = true;
  bool _sfxEnabled = true;

  bool get isMusicEnabled => _musicEnabled;
  bool get isSfxEnabled => _sfxEnabled;

  Future<void> playBackgroundMusic() async {
    if (_musicEnabled) {
      await _bgmPlayer.setReleaseMode(ReleaseMode.loop);
      await _bgmPlayer.play(AssetSource('audio/background_music.mp3'));
    }
  }

  void setMusicEnabled(bool enabled) {
    _musicEnabled = enabled;
    enabled ? playBackgroundMusic() : _bgmPlayer.stop();
  }

  void setSfxEnabled(bool enabled) {
    _sfxEnabled = enabled;
  }

  Future<void> playClickSound() async {
    if (_sfxEnabled) {
      await _sfxPlayer.stop();
      await _sfxPlayer.play(AssetSource('audio/click_sound.mp3'));
    }
  }

  Future<void> stopAll() async {
    await _bgmPlayer.stop();
    await _sfxPlayer.stop();
  }
}
