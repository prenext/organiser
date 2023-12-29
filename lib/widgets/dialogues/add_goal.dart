import 'package:flutter/material.dart';


 void showSetGoalDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 10.0,
          child: _AddGoalDialogContent(),
        );
      },
    );
  }

class _AddGoalDialogContent extends StatefulWidget {
  @override
  _AddGoalDialogContentState createState() => _AddGoalDialogContentState();
}

class _AddGoalDialogContentState extends State<_AddGoalDialogContent> {
  // Define your variables for goal details
  String title = '';
  String description = '';
  String priority = '';
  String span = '';
  String category = '';
  DateTime dueDate = DateTime.now();
  List<String> relatedTasksIds = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Set New Goal',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            onChanged: (value) {
              title = value;
            },
            decoration: InputDecoration(labelText: 'Goal Title'),
          ),
          TextField(
            onChanged: (value) {
              description = value;
            },
            decoration: InputDecoration(labelText: 'Goal Description'),
          ),
          TextField(
            onChanged: (value) {
              priority = value;
            },
            decoration: InputDecoration(labelText: 'Priority'),
          ),
          TextField(
            onChanged: (value) {
              span = value;
            },
            decoration: InputDecoration(labelText: 'Time Span'),
          ),
          TextField(
            onChanged: (value) {
              category = value;
            },
            decoration: InputDecoration(labelText: 'Category'),
          ),
          Row(
            children: [
              Text('Due Date: ${dueDate.toLocal()}'),
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: dueDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null && pickedDate != dueDate)
                    setState(() {
                      dueDate = pickedDate;
                    });
                },
              ),
            ],
          ),
          TextField(
            onChanged: (value) {
              // Split related tasks by comma and store in the list
              relatedTasksIds = value.split(',').map((e) => e.trim()).toList();
            },
            decoration: InputDecoration(
                labelText: 'Related Tasks IDs (comma-separated, optional)'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Add logic to save the goal to the database
              // using the provided details (title, description, priority, span, category, dueDate, relatedTasksIds)
              Navigator.pop(context); // Close the dialog after setting the goal
            },
            child: Text('Set Goal'),
          ),
        ],
      ),
    );
  }
}

