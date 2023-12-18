import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';


 void showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 10.0,
          child: _AddTaskDialogContent(),
        );
      },
    );
  }

class _AddTaskDialogContent extends StatefulWidget {
  @override
  _AddTaskDialogContentState createState() => _AddTaskDialogContentState();
}

class _AddTaskDialogContentState extends State<_AddTaskDialogContent> {
  // Define your variables for task details
  String title = '';
  String description = '';
  String priority = '';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isRepetitive = false;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 7));
  Duration selectedDuration = Duration(hours: 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add New Task',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            onChanged: (value) {
              title = value;
            },
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            onChanged: (value) {
              description = value;
            },
            decoration: InputDecoration(labelText: 'Description'),
          ),
          TextField(
            onChanged: (value) {
              priority = value;
            },
            decoration: InputDecoration(labelText: 'Priority'),
          ),
          Row(
            children: [
              Text('Date: ${selectedDate.toLocal()}'),
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null && pickedDate != selectedDate)
                    setState(() {
                      selectedDate = pickedDate;
                    });
                },
              ),
            ],
          ),
          Row(
            children: [
              Text('Time: ${selectedTime.format(context)}'),
              IconButton(
                icon: Icon(Icons.access_time),
                onPressed: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                  );
                  if (pickedTime != null && pickedTime != selectedTime)
                    setState(() {
                      selectedTime = pickedTime;
                    });
                },
              ),
            ],
          ),
          Row(
            children: [
              Text(
                  'Duration: ${selectedDuration.inHours} hours ${selectedDuration.inMinutes.remainder(60)} minutes'),
              IconButton(
                icon: Icon(Icons.timer),
                onPressed: () async {
                  Duration? pickedDuration =
                      await _pickDuration(context, selectedDuration);
                  if (pickedDuration != null)
                    setState(() {
                      selectedDuration = pickedDuration;
                    });
                },
              ),
            ],
          ),
          Row(
            children: [
              Text('Repetitive Task'),
              Switch(
                value: isRepetitive,
                onChanged: (value) {
                  setState(() {
                    isRepetitive = value;
                  });
                },
              ),
            ],
          ),
          if (isRepetitive)
            Column(
              children: [
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
              ],
            ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Add logic to save the task to the database
              // using the provided details (title, description, etc.)
              Navigator.pop(context); // Close the dialog after adding the task
            },
            child: Text('Add Task'),
          ),
        ],
      ),
    );
  }

  Future<Duration?> _pickDuration(
      BuildContext context, Duration initialDuration) async {
    int? hours;
    int? minutes;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pick Duration'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text('Hours: '),
                  NumberPicker(
                    value: initialDuration.inHours,
                    minValue: 0,
                    maxValue: 23,
                    onChanged: (value) {
                      hours = value;
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Minutes: '),
                  NumberPicker(
                    value: initialDuration.inMinutes.remainder(60),
                    minValue: 0,
                    maxValue: 59,
                    onChanged: (value) {
                      minutes = value;
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );

    if (hours != null && minutes != null) {
      return Duration(hours: hours!, minutes: minutes!);
    } else {
      return null;
    }
  }
}
