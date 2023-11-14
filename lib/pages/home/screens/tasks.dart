import 'package:flutter/material.dart';

class Tasks extends StatelessWidget {
  const Tasks({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: TaskList(),
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TaskCard('Task 1', 'Description 1'),
        TaskCard('Task 2', 'Description 2'),
        TaskCard('Task 3', 'Description 3'),
        // Add more task cards as needed
      ],
    );
  }
}

class TaskCard extends StatelessWidget {
  final String task;
  final String description;

  TaskCard(this.task, this.description);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task),
        subtitle: Text(description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Handle edit button click
              },
            ),
            IconButton(
              icon: Icon(Icons.done),
              onPressed: () {
                // Handle mark as done button click
              },
            ),
          ],
        ),
      ),
    );
  }
}
