import 'package:flutter/material.dart';

class PlaylistWidget extends StatelessWidget {
  const PlaylistWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              const Text("Playlist"),
              DropdownButton(
                style: Theme.of(context).textTheme.bodyText1,
                items: const [
                  DropdownMenuItem(child: Text(" Recently added ")),
                ],
                onChanged: (_) {},
              ),
            ],
          ),
          const ListTile(
            leading: Icon(Icons.thumb_up),
            title: Text("Liked videos"),
            subtitle: Text("74 videos"),
          ),
          const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Osama Elafandy 2019"),
            subtitle: Text("Osama. 3 videos"),
          ),
        ],
      ),
    );
  }
}
