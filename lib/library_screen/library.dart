import 'package:flutter/material.dart';
import 'package:youtube/library_screen/widgets/offline_widget.dart';
import 'package:youtube/library_screen/widgets/personal_widget.dart';
import 'package:youtube/library_screen/widgets/playlist_widget.dart';
import 'package:youtube/library_screen/widgets/recent_widget.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const RecentWidget(),
        PersonalWidget(),
        const OfflineWidget(),
        const PlaylistWidget(),
      ],
    );
  }
}
