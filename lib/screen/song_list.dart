import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:yeongdu_music_flutter/controller/audio_controller.dart';

class SongList extends StatelessWidget {
  final AudioController audioController = Get.find();

  SongList({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    List<SongModel> songs = audioController.getSongs();

    return SafeArea(child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: audioController.getLength(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(songs[index].title),
              Text(songs[index].artist ?? 'Unknown Artist'),
            ],
          )
        );
      },
    ));
  }
}