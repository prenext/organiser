import 'package:flutter/material.dart';

 void showCreateEventDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 10.0,
          child: _AddEventDialogContent(),
        );
      },
    );
  }

class _AddEventDialogContent extends StatefulWidget {
  @override
  _AddEventDialogContentState createState() => _AddEventDialogContentState();
}

class _AddEventDialogContentState extends State<_AddEventDialogContent> {
  // Define your variables for event details
  String title = '';
  String description = '';
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 7));
  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create New Event',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            onChanged: (value) {
              title = value;
            },
            decoration: InputDecoration(labelText: 'Event Title'),
          ),
          TextField(
            onChanged: (value) {
              description = value;
            },
            decoration: InputDecoration(labelText: 'Event Description'),
          ),
          Row(
            children: [
              Text('Start Date: ${startDate.toLocal()}'),
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: startDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null && pickedDate != startDate)
                    setState(() {
                      startDate = pickedDate;
                    });
                },
              ),
            ],
          ),
          Row(
            children: [
              Text('End Date: ${endDate.toLocal()}'),
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: endDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null && pickedDate != endDate)
                    setState(() {
                      endDate = pickedDate;
                    });
                },
              ),
            ],
          ),
          TextField(
            onChanged: (value) {
              // Split tasks by comma and store in the list
              tasks = value.split(',').map((e) => e.trim()).toList();
            },
            decoration: InputDecoration(
                labelText: 'Tasks (comma-separated, optional)'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Add logic to save the event to the database
              // using the provided details (title, description, startDate, endDate, tasks)
              Navigator.pop(context); // Close the dialog after creating the event
            },
            child: Text('Create Event'),
          ),
        ],
      ),
    );
  }
}
