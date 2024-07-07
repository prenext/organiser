import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Organiser/views/services/common/task_provider.dart';
import 'package:Organiser/models/common/task_model.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late TaskProvider _taskProvider;
  final userId = FirebaseAuth.instance.currentUser!.uid;
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _taskProvider = TaskProvider.create(
      controllerSource: 'users',
      controllerUserId: userId,
    );
    fetchTasks();
  }

  // fetch tasks method
  void fetchTasks() async {
    await _taskProvider.getTasks(context);
    setState(() {
      tasks = _taskProvider.tasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: _taskProvider,
        child: TaskList(tasks: tasks),
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  TaskList({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? Center(
            child: Text('No tasks found.'),
          )
        : ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];

              return ListTile(
                title: Text(task.title),
                subtitle: Text(task.description),
                trailing: IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    // Implement update task logic here
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskDetailsScreen(task: task),
                    ),
                  );
                },
              );
            },
          );
  }
}

class TaskDetailsScreen extends StatelessWidget {
  final Task task;

  const TaskDetailsScreen({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(task.description),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<TaskProvider>(context, listen: false)
                    .deleteTask(task.id, context);
                Navigator.pop(context);
              },
              child: Text('Delete Task'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You can implement adding a new task logic here
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Center(
        child: Text('Add Task Screen'),
      ),
    );
  }
}
