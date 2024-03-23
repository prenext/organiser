import 'package:Organiser/views/widgets/common/custom_appbar.dart';
import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  List<String> tasks = [
    'Task 1',
    'Task 2',
    'Task 3',
    'Task 4',
    'Task 5',
    'Task 6',
    'Task 7',
    'Task 8',
  ];

  List<String> filters = ['All', 'Pending', 'Completed'];
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CustomAppBar(
        leading: Icon(Icons.task),
        centerTitle: false,
        title: Text('Tasks'),
        actions: [
          _buildFilterChips(),
        ],
      ),
      body: _buildTaskList(),
    );
  }

  Widget _buildFilterChips() {
    return Wrap(
      spacing: 8.0,
      children: filters.map((filter) {
        return FilterChip(
          label: Text(filter),

          side: BorderSide(
            color: Theme.of(context)
                .primaryColor
                .withOpacity(0.5), // Use theme primary color for border
            width: 0.5, // Adjust border width as needed
          ),

          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(30.0), // Adjust border radius as needed
            side: BorderSide(
              color: Theme.of(context)
                  .primaryColor, // Use theme primary color for border
              width: 1.0, // Adjust border width as needed
            ),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: 1, vertical: 0.0), // Adjust padding as needed
          color: MaterialStateProperty.resolveWith((states) => Theme.of(context)
              .scaffoldBackgroundColor), // Use theme scaffoldBackgroundColor for chip background
          checkmarkColor: Theme.of(context)
              .primaryColor, // Use theme primary color for checkmark
          labelStyle: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w300,
              color: Theme.of(context).primaryColor),
          selected: selectedFilter == filter,
          onSelected: (isSelected) {
            setState(() {
              selectedFilter = isSelected ? filter : 'All';
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildTaskList() {
    List<String> filteredTasks = tasks;

    // Apply filtering based on the selected filter
    if (selectedFilter != 'All') {
      filteredTasks = tasks.where((task) {
        // You can customize this condition based on your task status
        return task.contains(selectedFilter);
      }).toList();
    }

    return ListView.builder(
      itemCount: filteredTasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredTasks[index]),
          // Customize the ListTile as needed for your task representation
        );
      },
    );
  }
}
