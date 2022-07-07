import 'package:flutter/material.dart';
import 'package:youtube/models/youtube_model.dart';
import 'package:youtube/widgets/button_column_widget.dart';

class VideoInfoWidget extends StatelessWidget {
  final YoutubeModel detail;
  const VideoInfoWidget({Key key, this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            detail.title,
            maxLines: 2,
          ),
          subtitle: Text(detail.viewCount),
          trailing: const Icon(Icons.arrow_drop_down),
        ),
        Container(
          padding: const EdgeInsets.all(0.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ButtonColumnWidget(
                    icon: Icons.thumb_up, text: detail.likeCount),
                ButtonColumnWidget(
                    icon: Icons.thumb_down, text: detail.dislikeCount),
                const ButtonColumnWidget(icon: Icons.share, text: "Share"),
                const ButtonColumnWidget(
                    icon: Icons.cloud_download, text: "Download"),
                const ButtonColumnWidget(
                    icon: Icons.playlist_add, text: "Save"),
              ],
            ),
          ),
        )
      ],
    );
  }
}
