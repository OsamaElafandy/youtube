import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:youtube/youtube_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "YouTube",
      debugShowCheckedModeBanner: false,
      home: YoutubeMain(),
    );
  }
}
