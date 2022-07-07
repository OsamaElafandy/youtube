import 'package:flutter/material.dart';

class Subscriptions extends StatelessWidget {
  const Subscriptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
        child: Image.asset(
      'assets/subscribe.jpg',
      width: size.width,
      height: size.height * .7,
    ));
  }
}
