import 'package:flutter/material.dart';
import 'package:youtube/home/home.dart';
import 'package:youtube/Inbox/inbox.dart';
import 'package:youtube/library_screen/library.dart';
import 'package:youtube/search_delegate.dart';
import 'package:youtube/subscriptions/subscriptions.dart';
import 'package:youtube/trending/trending.dart';

class YoutubeMain extends StatefulWidget {
  const YoutubeMain({Key key}) : super(key: key);

  @override
  YoutubeMainState createState() => YoutubeMainState();
}

class YoutubeMainState extends State<YoutubeMain> {
  int _currentIndex = 0;

  _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const TrendingScreen(),
    const Subscriptions(),
    const InboxScreen(),
    const LibraryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.grey),
        title: Image.asset(
          'assets/youtube_logo.png',
          width: 98.0,
          height: 22.0,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchDelegateWidget());
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          onTap: _onTapped,
          items: const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "Trending", icon: Icon(Icons.whatshot)),
            BottomNavigationBarItem(
                label: "Subscriptions", icon: Icon(Icons.subscriptions)),
            BottomNavigationBarItem(label: "Inbox", icon: Icon(Icons.mail)),
            BottomNavigationBarItem(label: "Library", icon: Icon(Icons.folder)),
          ]),
    );
  }
}
