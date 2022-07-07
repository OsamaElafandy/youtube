import 'package:flutter/material.dart';

class ButtonColumnWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const ButtonColumnWidget({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 50.0,
            height: 50.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 8.0),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.7),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 21.0,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            text,
            style: TextStyle(color: Colors.grey[700], fontSize: 13),
          ),
        ],
      ),
    );
  }
}
