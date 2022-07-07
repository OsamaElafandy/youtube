import 'package:flutter/material.dart';

class OfflineWidget extends StatelessWidget {
  const OfflineWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.only(top: 16.0, left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Available offline"),
          ListTile(
            leading: const Icon(Icons.file_download),
            title: const Text("Downloads"),
            subtitle: const Text("0 videos"),
            trailing: Icon(
              Icons.check_circle,
              color: Colors.red[700],
            ),
          )
        ],
      ),
    );
  }
}
