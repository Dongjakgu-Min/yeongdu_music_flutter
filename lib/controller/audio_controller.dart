
import 'package:on_audio_query/on_audio_query.dart';
import 'package:get/get.dart';

import 'dart:developer';

class AudioController extends GetxController {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  List<SongModel> songs = [];

  @override
  void onInit() async {
    super.onInit();

    if (!await _audioQuery.permissionsStatus()) {
      await _audioQuery.permissionsRequest();
    }

    songs = await _audioQuery.querySongs();
  }

  getLength() {
    return songs.length;
  }

  getSongs() {
    return songs;
  }
}