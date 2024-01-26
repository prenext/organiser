// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class TimeZoneAdder extends StatefulWidget {
  @override
  _TimeZoneAdder createState() => _TimeZoneAdder();
}

class _TimeZoneAdder extends State<TimeZoneAdder> {
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
            Icon(Icons.punch_clock_sharp),
            SizedBox(width: 5,),
            Expanded(
              child: TextField(
               // controller: controller,
                keyboardType: TextInputType.number,
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
