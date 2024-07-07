import 'package:Organiser/views/pages/screens/tasks.dart';
import 'package:flutter/material.dart';
import 'package:Organiser/views/widgets/common/tabs_appbar.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: TabsAppBar(
            title: "Workspace",
            tabs: [
              Tab(
                text: 'Tasks',
              ),
              Tab(
                text: 'Goals',
              ),
              Tab(
                text: 'Events',
              ),
            ],
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              IconButton(onPressed: () {}, icon: Icon(Icons.calendar_month)),
            ],
          ),
          body: TabBarView(
            children: [
              _buildTasksView(),
              _buildGoalsView(),
              _buildEventsView()
            ],
          ),
          // _buildTaskList(),
        ));
  }

  Widget _buildTasksView() {
    return Center(
      child: TaskScreen(),
    );
  }

  Widget _buildGoalsView() {
    // You can customize this view for displaying events
    return Center(
      child: Text('Goals View'),
    );
  }

  Widget _buildEventsView() {
    // You can customize this view for displaying events
    return Center(
      child: Text('Events View'),
    );
  }
}
