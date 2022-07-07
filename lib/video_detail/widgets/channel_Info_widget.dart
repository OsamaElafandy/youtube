import 'package:flutter/material.dart';
import 'package:youtube/models/youtube_model.dart';

class ChannelInfoWidget extends StatelessWidget {
  final YoutubeModel detail;
  const ChannelInfoWidget({Key key, this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(detail.channelAvatar),
              ),
              title: Text(
                detail.channelTitle,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(detail.subscriptionCount),
            ),
          ),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.play_circle_filled,
                color: Colors.red,
              ),
              label: const Text(
                "SUBSCRIBE",
                style: TextStyle(color: Colors.red),
              )),
          const SizedBox(width: 8.0),
        ],
      ),
    );
  }
}
