import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SeekController extends GetxController {
  RxDouble duration = 0.0.obs;
  RxDouble position = 0.0.obs;
  Duration? bufferedPosition;
  ValueChanged<Duration?>? onChanged;
  ValueChanged<Duration?>? onChangeEnd;

  get pos => position;
  get dur => duration;

  setPosition(double pos) {
    position.value= pos;
    position.refresh();
  }

  setDuration(double dur) {
    position.value = dur;
  }
}