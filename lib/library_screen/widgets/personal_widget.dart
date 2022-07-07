import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PersonalWidget extends StatelessWidget {
  PersonalWidget({Key key}) : super(key: key);

  List<Map> items = [
    {"name": "History", "icon": const Icon(Icons.history)},
    {"name": "My Videos", "icon": const Icon(Icons.video_library)},
    {
      "name": "Watch Later",
      "icon": const Icon(Icons.watch_later),
      "extra": "3 unwatched videos"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey),
        ),
      ),
      child: Column(
        children: items
            .map((i) => ListTile(
                  leading: i["icon"],
                  title: i["extra"] == null
                      ? Text(i["name"])
                      : Row(
                          children: <Widget>[
                            Text(i["name"]),
                            Container(
                              margin: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                i["extra"],
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                          ],
                        ),
                ))
            .toList(),
      ),
    );
  }
}
