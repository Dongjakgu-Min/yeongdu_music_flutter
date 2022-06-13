import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:developer';

import 'package:yeongdu_music_flutter/util/audio_player.dart';

class AudioBtn extends StatelessWidget {
  final SoundPlayer _player = SoundPlayer();

  AudioBtn({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Row(
      children: [
        StreamBuilder<PlayerState>(
            stream: _player.audioPlayer.playerStateStream,
            builder: (context, snapshot) {
              final playerState = snapshot.data;
              final processingState = playerState?.processingState;
              final playing = playerState?.playing;
              if (processingState == ProcessingState.loading || processingState == ProcessingState.buffering) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  width: 64.0,
                  height: 64.0,
                  child: const CircularProgressIndicator(),
                );
              }

              return Row(
                children: [
                  IconButton(
                      icon: const Icon(Icons.skip_previous_rounded),
                      color: Colors.white,
                      iconSize: 50,
                      onPressed: () {
                        _player.audioPlayer.seekToPrevious;
                      }),
                  IconButton(
                      icon: Icon(playing == true ? Icons.stop_rounded : Icons.play_arrow_rounded),
                      color: Colors.white,
                      iconSize: 50,
                      onPressed: () {
                        log(_player.audioPlayer.duration.toString());
                        playing == true ? _player.audioPlayer.stop() : _player.audioPlayer.play();
                      }),
                  IconButton(
                      icon: const Icon(Icons.skip_next_rounded),
                      color: Colors.white,
                      iconSize: 50,
                      onPressed: () {
                        _player.audioPlayer.seekToNext;
                      }),
                ],
              );
            }),
      ],
    );
  }
}
