import 'package:flutter/material.dart';


 void showCreateScheduleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 10.0,
          child: _AddScheduleDialogContent(),
        );
      },
    );
  }


class _AddScheduleDialogContent extends StatefulWidget {
  @override
  _AddScheduleDialogContentState createState() =>
      _AddScheduleDialogContentState();
}

class _AddScheduleDialogContentState extends State<_AddScheduleDialogContent> {
  // Define your variables for schedule details
  String title = '';
  String description = '';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isRepetitive = false;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 7));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add New Schedule',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            onChanged: (value) {
              title = value;
            },
            decoration: InputDecoration(labelText: 'Schedule Title'),
          ),
          TextField(
            onChanged: (value) {
              description = value;
            },
            decoration: InputDecoration(labelText: 'Schedule Description'),
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
              Text('Repetitive Schedule'),
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
              // Add logic to save the schedule to the database
              // using the provided details (title, description, etc.)
              Navigator.pop(context); // Close the dialog after adding the schedule
            },
            child: Text('Add Schedule'),
          ),
        ],
      ),
    );
  }
}
