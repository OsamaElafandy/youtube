import 'package:flutter/material.dart';
import 'package:youtube/models/youtube_model.dart';

class PortraitListWidget extends StatefulWidget {
  final int index;
  final List<YoutubeModel> listData;
  const PortraitListWidget(
      {Key key, @required this.index, @required this.listData})
      : super(key: key);

  @override
  State<PortraitListWidget> createState() => _PortraitListWidgetState();
}

class _PortraitListWidgetState extends State<PortraitListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.listData[widget.index].thumbNail),
                fit: BoxFit.cover),
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(8.0),
          dense: true,
          leading: CircleAvatar(
            backgroundImage:
                NetworkImage(widget.listData[widget.index].channelAvatar),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(widget.listData[widget.index].title),
          ),
          subtitle: Text(
              "${widget.listData[widget.index].channelTitle} . ${widget.listData[widget.index].viewCount} . ${widget.listData[widget.index].publishedTime}"),
          trailing: Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: const Icon(Icons.more_vert)),
        ),
      ],
    );
  }
}
