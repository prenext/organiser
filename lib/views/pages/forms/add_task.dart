import 'package:flutter/material.dart';
class CreateTaskPage extends StatefulWidget {
  @override
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText: 'Title',
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
              labelText: 'Description',
            ),
            maxLines: 3,
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              _saveTask();
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _saveTask() {
    final String title = _titleController.text.trim();
    final String description = _descriptionController.text.trim();

    // Implement your logic to save the task here
    print('Title: $title, Description: $description');
  }
}
