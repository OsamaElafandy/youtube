import 'package:flutter/material.dart';
import 'package:youtube/home/home.dart';

class RecentWidget extends StatelessWidget {
  const RecentWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205.0,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0),
            child: const Text("Recent"),
          ),
          const Expanded(
            child: HomeScreen(
              isHorizontalList: true,
            ),
          ),
        ],
      ),
    );
  }
}
