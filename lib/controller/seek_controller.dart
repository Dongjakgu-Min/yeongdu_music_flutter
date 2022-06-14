import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:yeongdu_music_flutter/util/audio_player.dart';

class SeekController extends GetxController {
  final SoundPlayer _soundPlayer = SoundPlayer();

  Rx<Duration?> duration = const Duration(milliseconds: 0).obs;
  Rx<Duration> position = const Duration(milliseconds: 0).obs;
  Rx<Duration> bufferedPosition = const Duration(milliseconds: 0).obs;

  Rx<double?> dragValue = Rx<double?>(null);

  void init() {
    duration.value = _soundPlayer.audioPlayer.duration ?? const Duration(milliseconds: 0);
    position.bindStream(_soundPlayer.audioPlayer.positionStream);
    bufferedPosition.bindStream(_soundPlayer.audioPlayer.bufferedPositionStream);
  }

  void setDragValue(double pos) {
    dragValue.value = pos;
    update();
  }

  void removeDragValue() {
    dragValue = Rx<double?>(null);
  }
}