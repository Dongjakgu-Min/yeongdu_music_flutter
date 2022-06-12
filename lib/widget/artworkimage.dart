import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:yeongdu_music_flutter/controller/audio_controller.dart';

class ArtworkImage extends StatelessWidget {
  final int id;

  const ArtworkImage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25), bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ]),
        child: artworkImage());
  }

  Widget artworkImage() {
    return QueryArtworkWidget(
      id: id,
      type: ArtworkType.AUDIO,
      artworkWidth: 370,
      artworkHeight: 370,
      artworkQuality: FilterQuality.high,
      size: 160000,
      artworkBorder: BorderRadius.circular(25),
    );
  }
}
