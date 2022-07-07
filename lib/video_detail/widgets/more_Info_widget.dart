import 'package:flutter/material.dart';

class MoreInfoWidget extends StatefulWidget {
  const MoreInfoWidget({Key key}) : super(key: key);

  @override
  State<MoreInfoWidget> createState() => _MoreInfoWidgetState();
}

class _MoreInfoWidgetState extends State<MoreInfoWidget> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Expanded(child: Text("Up next")),
          const Text("Autoplay"),
          Switch(
            onChanged: (c) {
              setState(() {
                _switchValue = c;
              });
            },
            value: _switchValue,
          ),
        ],
      ),
    );
  }
}
