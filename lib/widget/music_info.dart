import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:yeongdu_music_flutter/controller/audio_controller.dart';

class MusicInfo extends StatelessWidget {
  final String title;
  final String artist;

  const MusicInfo({Key? key, required this.title, required this.artist}) : super(key: key);

  @override
  Widget build(context) {
    return Column(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextScroll(mode: TextScrollMode.endless, title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
      TextScroll(mode: TextScrollMode.endless, artist, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
    ]);
  }
}
