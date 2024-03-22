// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class TimezoneAdder extends StatefulWidget {
  TextEditingController timezoneConroller = TextEditingController();

  TimezoneAdder({required this.timezoneConroller});

  @override
  _TimezoneAdder createState() => _TimezoneAdder();
}

class _TimezoneAdder extends State<TimezoneAdder> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              Icons.public,
              color: Theme.of(context).colorScheme.primary,
              size: 30,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: TextField(
                // controller: controller,
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 13),
                  hintText: 'GMT 800, East Africa Time, Nairobi',
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
