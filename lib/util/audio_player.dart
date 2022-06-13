import 'package:just_audio/just_audio.dart';

class SoundPlayer {
  late final AudioPlayer audioPlayer;
  static final _instance = SoundPlayer._internal();

  factory SoundPlayer() {
    return _instance;
  }

  SoundPlayer._internal() {
    audioPlayer = AudioPlayer();
  }
}