import 'package:flutter/material.dart';
import 'package:youtube/home/home.dart';
import 'package:youtube/widgets/button_column_widget.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 100.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              ButtonColumnWidget(icon: Icons.music_note, text: "Music"),
              ButtonColumnWidget(icon: Icons.live_tv, text: "Live"),
              ButtonColumnWidget(icon: Icons.videogame_asset, text: "Gaming"),
              ButtonColumnWidget(icon: Icons.insert_drive_file, text: "News"),
              ButtonColumnWidget(icon: Icons.local_movies, text: "Films"),
            ],
          ),
        ),
        const HomeScreen(),
      ],
    );
  }
}
