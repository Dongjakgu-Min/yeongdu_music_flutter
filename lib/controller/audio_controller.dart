
import 'dart:typed_data';

import 'package:on_audio_query/on_audio_query.dart';
import 'package:get/get.dart';

import 'dart:developer';

class AudioController extends GetxController {
  final OnAudioQuery _audioQuery = OnAudioQuery();

  List<SongModel> songList = [];

  @override
  void onInit() async {
    super.onInit();

    if (!await _audioQuery.permissionsStatus()) {
      await _audioQuery.permissionsRequest();
    }

    songList = await _audioQuery.querySongs();
  }

  get length => songs.length;
  get songs => songList;

  getArtwork(id) {
    return _audioQuery.queryArtwork(id, ArtworkType.AUDIO, quality: 99);
  }
}