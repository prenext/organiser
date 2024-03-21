import 'package:Organiser/views/widgets/common/action_button.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String selectedFilter = 'This Week';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFilterChips(),
              SizedBox(height: 20),
              _buildHighlights(),
              SizedBox(height: 20),
              _buildInsights(),
            ],
          ),
        ),
      ),
       floatingActionButton: CustomFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }

  Widget _buildFilterChips() {
    List<String> filters = ['This Week', 'Today', 'This Month', 'This Year'];

    return Wrap(
      spacing: 8.0,
      children: filters.map((filter) {
        return FilterChip(
          label: Text(filter),
          selected: selectedFilter == filter,
          onSelected: (isSelected) {
            setState(() {
              selectedFilter = isSelected ? filter : 'This Week';
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildHighlights() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Highlights',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          // Add widgets for highlights (tasks, events, calendars)
          // Example:
          ListTile(
            leading: Icon(Icons.check_circle, color: Colors.green),
            title: Text('Completed Task 1'),
          ),
          ListTile(
            leading: Icon(Icons.event, color: Colors.blue),
            title: Text('Upcoming Event 1'),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today, color: Colors.orange),
            title: Text('Calendar Event 1'),
          ),
        ],
      ),
    );
  }

  Widget _buildInsights() {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Insights',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          // Add widgets for insights (progress bars, charts, etc.)
          // Example:
          _buildProgressBar('Task Progress', 0.8), // 80% progress
          _buildProgressBar('Event Completion', 0.6), // 60% completion
        ],
      ),
    );
  }

  Widget _buildProgressBar(String label, double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        LinearProgressIndicator(
          value: value,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
