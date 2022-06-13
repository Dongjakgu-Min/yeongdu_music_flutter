import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import 'package:yeongdu_music_flutter/controller/audio_controller.dart';
import 'package:yeongdu_music_flutter/controller/seek_controller.dart';
import 'package:yeongdu_music_flutter/widget/artworkimage.dart';
import 'package:yeongdu_music_flutter/widget/audio_btn.dart';
import 'package:yeongdu_music_flutter/widget/music_info.dart';

import '../util/audio_player.dart';

class MusicScreen extends StatelessWidget {
  final SongModel model;

  const MusicScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(context) {
    return screen();
  }

  Widget screen() {
    return Scaffold(
      body: Music(model: model),
    );
  }
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}

class Music extends StatelessWidget {
  final AudioController audioController = Get.find();
  final SeekController seekController = Get.find();

  final _player = SoundPlayer();
  final SongModel model;

  Music({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
        body: SafeArea(
      child: body(),
    ));
  }

  Stream<PositionData> get _positionDataStream =>
      rxdart.Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _player.audioPlayer.positionStream,
        _player.audioPlayer.bufferedPositionStream,
        _player.audioPlayer.durationStream,
          (position, bufferedPosition, duration) => PositionData(position, bufferedPosition, duration ?? Duration.zero
          )
      );

  Widget body() {
    return Container(
        margin: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ArtworkImage(id: model.id),
              MusicInfo(title: model.title, artist: model.artist ?? 'Unknown Artist'),
              StreamBuilder<PositionData>(
                stream: _positionDataStream,
                builder: (context, snapshot) {
                  final positionData = snapshot.data;

                  return Slider(
                      min: 0.0,
                      max: positionData!.duration.inMilliseconds.toDouble(),
                      onChanged: (double value) {
                        log(value.toString());
                        seekController.setPosition(value);
                        log(seekController.position.toString());
                      },
                      onChangeEnd: (double value) {
                        _player.audioPlayer.seek(Duration(milliseconds: value.toInt()));
                        seekController.setPosition(value);
                      },
                      value: positionData.position.inMilliseconds.toDouble()
                  );
                }
              ),
              FutureBuilder(future: _player.audioPlayer.setUrl(model.uri as String), builder: (context, snapshot) {
                if (snapshot.hasData == false) {
                  return const CircularProgressIndicator();
                } else {
                  return AudioBtn();
                }
              })
            ],
          ),
        ));
  }
}
