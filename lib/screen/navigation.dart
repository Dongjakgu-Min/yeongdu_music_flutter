import 'package:flutter/material.dart';
import 'package:yeongdu_music_flutter/screen/song_list.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({Key? key}) : super(key: key);

  final List<Widget> _widgetOptions = [
    SongList(),
    const SafeArea(child: Text('song')),
    const SafeArea(child: Text('Info'))
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        bottomNavigationBar: const TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.audio_file),
            ),
            Tab(
              icon: Icon(Icons.audio_file),
            ),
            Tab(
              icon: Icon(Icons.audio_file),
            )
          ],
          indicatorColor: Colors.transparent,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.blueAccent,
        ),
        body: TabBarView(
          children: _widgetOptions,
        ),
      ),
    );
  }
}
