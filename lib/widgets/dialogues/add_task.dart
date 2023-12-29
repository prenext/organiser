import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:Organiser/models/sub_collections/task.dart'; 

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
  late String title;
  late String description;
  late Map<String, bool> subtasks = {};
  late DateTime doDay = DateTime.now();
  late DoTime doTime = DoTime.morning;
  late int priority = 1;
  late String category = '';
  late bool repeat = false;
  late RepeatInterval repeatInterval = RepeatInterval.daily;
  late int repeatCount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Add New Task',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                
              ),
            ),
          ),
           SizedBox(height: 16),
          buildOutlinedTextField(
            labelText: 'Title',
            onChanged: (value) {
              title = value;
            },
          ),
           SizedBox(height: 16),
          buildOutlinedTextField(
            labelText: 'Description',
            onChanged: (value) {
              description = value;
            },
          ),
           SizedBox(height: 16),
          buildOutlinedTextField(
            labelText: 'Category',
            onChanged: (value) {
              category = value;
            },
          ),
           SizedBox(height: 16),
          buildOutlinedTextField(
            labelText: 'Subtasks',
            onChanged: (value) {
              // Handle subtasks input
            },
          ),
          Row(
            children: [
              Text('Date: ${doDay.toLocal()}'),
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: doDay,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null && pickedDate != doDay)
                    setState(() {
                      doDay = pickedDate;
                    });
                },
              ),
            ],
          ),
          Row(
            children: [
              Text('Time: ${doTime.toString().split('.').last}'),
              IconButton(
                icon: Icon(Icons.access_time),
                onPressed: () async {
                  DoTime? pickedDoTime =
                      await showDoTimePicker(context, doTime);
                  if (pickedDoTime != null && pickedDoTime != doTime)
                    setState(() {
                      doTime = pickedDoTime;
                    });
                },
              ),
            ],
          ),
          Row(
            children: [
              Text('Priority: $priority'),
              IconButton(
                icon: Icon(Icons.priority_high),
                onPressed: () async {
                  int? pickedPriority =
                      await showPriorityPicker(context, priority);
                  if (pickedPriority != null && pickedPriority != priority)
                    setState(() {
                      priority = pickedPriority;
                    });
                },
              ),
            ],
          ),
          Row(
            children: [
              Text('Repetitive Task'),
              Switch(
                value: repeat,
                onChanged: (value) {
                  setState(() {
                    repeat = value;
                  });
                },
              ),
            ],
          ),
          if (repeat)
            Column(
              children: [
                Row(
                  children: [
                    Text(
                        'Repeat Interval: ${repeatInterval.toString().split('.').last}'),
                    IconButton(
                      icon: Icon(Icons.repeat),
                      onPressed: () async {
                        RepeatInterval? pickedRepeatInterval =
                            await showRepeatIntervalPicker(
                                context, repeatInterval);
                        if (pickedRepeatInterval != null &&
                            pickedRepeatInterval != repeatInterval)
                          setState(() {
                            repeatInterval = pickedRepeatInterval;
                          });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Repeat Count: $repeatCount'),
                    IconButton(
                      icon: Icon(Icons.repeat),
                      onPressed: () async {
                        int? pickedRepeatCount =
                            await showRepeatCountPicker(context, repeatCount);
                        if (pickedRepeatCount != null &&
                            pickedRepeatCount != repeatCount)
                          setState(() {
                            repeatCount = pickedRepeatCount;
                          });
                      },
                    ),
                  ],
                ),
              ],
            ),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add logic to save the task to the database
                // ignore: unused_local_variable
                Task newTask = Task(
                  id: 'unique_id', 
                  title: title,
                  description: description,
                  subtasks: subtasks,
                  doDay: doDay,
                  doTime: doTime,
                  priority: priority,
                  category: category,
                  repeat: repeat,
                  repeatInterval: repeatInterval,
                  repeatCount: repeatCount,
                );
          
                // Call a function to save the newTask to the database
                // saveTaskToDatabase(newTask);
          
                Navigator.pop(context); // Close the dialog after adding the task
              },
              child: Text('Add Task'),
            ),
          ),
        ],
      ),
    );
  }

  Future<DoTime?> showDoTimePicker(
      BuildContext context, DoTime initialDoTime) async {
    return await showDialog<DoTime>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pick Time'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Morning'),
                onTap: () => Navigator.pop(context, DoTime.morning),
              ),
              ListTile(
                title: Text('Afternoon'),
                onTap: () => Navigator.pop(context, DoTime.afternoon),
              ),
              ListTile(
                title: Text('Evening'),
                onTap: () => Navigator.pop(context, DoTime.evening),
              ),
              ListTile(
                title: Text('Custom'),
                onTap: () => Navigator.pop(context, DoTime.custom),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<int?> showPriorityPicker(
      BuildContext context, int initialPriority) async {
    return await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pick Priority'),
          content: NumberPicker(
            value: initialPriority,
            minValue: 1,
            maxValue: 3,
            onChanged: (value) => Navigator.pop(context, value),
          ),
        );
      },
    );
  }

  Widget buildOutlinedTextField({
    required String labelText,
    required Function(String) onChanged,
    String? value,
  }) {
    return TextField(
      onChanged: onChanged,
      controller: TextEditingController(text: value),
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }

  Future<RepeatInterval?> showRepeatIntervalPicker(
      BuildContext context, RepeatInterval initialRepeatInterval) async {
    return await showDialog<RepeatInterval>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pick Repeat Interval'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Daily'),
                onTap: () => Navigator.pop(context, RepeatInterval.daily),
              ),
              ListTile(
                title: Text('Weekly'),
                onTap: () => Navigator.pop(context, RepeatInterval.weekly),
              ),
              ListTile(
                title: Text('Monthly'),
                onTap: () => Navigator.pop(context, RepeatInterval.monthly),
              ),
              ListTile(
                title: Text('Yearly'),
                onTap: () => Navigator.pop(context, RepeatInterval.yearly),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<int?> showRepeatCountPicker(
      BuildContext context, int initialRepeatCount) async {
    return await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pick Repeat Count'),
          content: NumberPicker(
            value: initialRepeatCount,
            minValue: 1,
            maxValue: 10, // Adjust the maximum repeat count as needed
            onChanged: (value) => Navigator.pop(context, value),
          ),
        );
      },
    );
  }
}
