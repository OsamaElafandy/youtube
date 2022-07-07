import 'package:flutter/material.dart';
import 'package:youtube/models/youtube_model.dart';

class LandscapeListWidget extends StatelessWidget {
  final int index;
  final List<YoutubeModel> listData;
  final bool isMiniList;
  final bool isHorizontalList;
  const LandscapeListWidget(
      {Key key,
      @required this.index,
      @required this.listData,
      @required this.isMiniList,
      @required this.isHorizontalList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          Container(
//
            width: isMiniList
                ? MediaQuery.of(context).size.width / 2
                : 336.0 / 1.5,
            height: isMiniList ? 100.0 : 188.0 / 1.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(listData[index].thumbNail),
                  fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  contentPadding: const EdgeInsets.all(8.0),
                  dense: isMiniList ? true : false,
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      listData[index].title,
                      maxLines: 2,
                    ),
                  ),
                  subtitle: isMiniList
                      ? Text(
                          "${listData[index].channelTitle} . ${listData[index].viewCount} . ${listData[index].publishedTime}")
                      : Text(
                          "${listData[index].channelTitle} . ${listData[index].viewCount}"),
                  trailing: Container(
                      margin: const EdgeInsets.only(bottom: 30.0),
                      child: const Icon(Icons.more_vert)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
