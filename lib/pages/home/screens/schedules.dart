import 'package:flutter/material.dart';

class Schedule extends StatelessWidget {
  const Schedule({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          // Calendar Widget
          CalendarWidget(),

          // Table-Like Format for Today's Tasks
          TableLikeFormat(),

          // Cards Showing Past Schedules
          PastSchedulesCards(),
        ],
      ),
    );
  }
}

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create and return your calendar widget here
    // You can use a package like `table_calendar` to implement a calendar.
    // Example: https://pub.dev/packages/table_calendar
    return Card(
     elevation: 20,
     child: SizedBox(height: 450,)
    );
  }
}

class TableLikeFormat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create and return your table-like format widget for displaying today's tasks.
    return Card(
      elevation: 20,
        child: SizedBox(height: 150,)
    );
  }
}

class PastSchedulesCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create and return a list of cards showing past schedules.
    return Expanded(
      child: ListView(
        children: [
          PastScheduleCard('Task 1', 'Date 1'),
          PastScheduleCard('Task 2', 'Date 2'),
          PastScheduleCard('Task 3', 'Date 3'),
          // Add more past schedule cards as needed
        ],
      ),
    );
  }
}

class PastScheduleCard extends StatelessWidget {
  final String task;
  final String date;

  PastScheduleCard(this.task, this.date);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task),
        subtitle: Text('Date: $date'),
      ),
    );
  }
}
