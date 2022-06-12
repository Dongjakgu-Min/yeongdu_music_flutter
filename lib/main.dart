import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:async/async.dart';

import 'package:path_provider/path_provider.dart';
import 'package:yeongdu_music_flutter/screen/navigation.dart';

import 'dart:developer';

import 'controller/audio_controller.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
    ),
    themeMode: ThemeMode.system,
    home: Home())
  );
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final AudioController audioController = Get.put(AudioController());

  @override
  Widget build(context) {
    return Scaffold(
      body: BottomNavigation(),
    );
  }
}

class FileController extends GetxController {
  var elements = [].obs;
  findAll() async {

    log(((await getExternalStorageDirectory())).toString());
  }

  Directory _findRoot(FileSystemEntity entity) {
    final Directory parent = entity.parent;
    if (parent.path == entity.path) return parent;
    return _findRoot(entity);
  }
}
