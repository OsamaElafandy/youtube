import 'package:flutter/material.dart';
import 'package:youtube/models/youtube_model.dart';

class HorizontalListWidget extends StatelessWidget {
  final int index;
  final List<YoutubeModel> listData;
  const HorizontalListWidget(
      {Key key, @required this.index, @required this.listData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336.0 / 2.2,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 4.0),
            width: 336.0 / 2.2,
            height: 188 / 2.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(listData[index].thumbNail),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        listData[index].title,
                        style: const TextStyle(fontSize: 12.0),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      listData[index].channelTitle,
                      style: TextStyle(
                        fontSize: 12.0,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.more_vert,
                size: 16.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
