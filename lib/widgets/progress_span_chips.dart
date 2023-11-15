import 'package:flutter/material.dart';

class progress_span_chips extends StatelessWidget {
  const progress_span_chips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Chip(
            backgroundColor: Colors.purple,
            padding:
                EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
            label: Text(
              "Today",
              style: TextStyle(color: Colors.white),
            )),
        Chip(
            backgroundColor: Colors.transparent,
            side: BorderSide(color: Colors.purpleAccent),
            padding:
                EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
            label: Text(
              "Yesterday",
              style: TextStyle(color: Colors.purple),
            )),
        Chip(
            padding:
                EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
            backgroundColor: Colors.transparent,
            side: BorderSide(color: Colors.purpleAccent),
            label: Text(
              "This Week",
              style: TextStyle(color: Colors.purple),
            )),
        Chip(
            padding:
                EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
            backgroundColor: Colors.transparent,
            side: BorderSide(color: Colors.purpleAccent),
            label: Text(
              "Overall",
              style: TextStyle(color: Colors.purple),
            )),
      ],
    );
  }
}
