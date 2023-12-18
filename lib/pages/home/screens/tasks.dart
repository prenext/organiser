import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: IntrinsicHeight(
        child: Column(
          children: [Center(child: Text("Tasks"))],
        ),
      ),
    );
  }
}
