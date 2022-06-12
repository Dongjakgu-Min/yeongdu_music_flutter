import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:yeongdu_music_flutter/controller/audio_controller.dart';

import 'dart:developer';

import 'package:yeongdu_music_flutter/screen/player.dart';

class SongList extends StatelessWidget {
  final AudioController audioController = Get.find();

  SongList({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    List<SongModel> songs = audioController.songs;

    return SafeArea(child: elements(songs));
  }

  Widget elements(List<SongModel> songs) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: audioController.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: () {
              log(songs[index].uri ?? 'path');
              Navigator.push(context, MaterialPageRoute(builder: (_) => MusicScreen(model: songs[index])));
            },
            child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(songs[index].title),
                    Text(songs[index].artist ?? 'Unknown Artist'),
                  ],
                ))
        );
      },
    );
  }
}
