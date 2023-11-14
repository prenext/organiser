import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 200, // Set the height for your bar graph container
            child: YourBarGraphWidget(),
          ),
          SizedBox(height: 20),
          Container(
            height: 200, // Set the height for your pie chart container
            child: YourPieChartWidget(),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                YourCardInRowWidget(taskName: 'School', isCompleted: false,),
                YourCardInRowWidget(taskName: 'Bath', isCompleted: false,),
                YourCardInRowWidget(taskName: 'Eat', isCompleted: false,),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              YourCardInRowWidget(taskName: 'School', isCompleted: true,),
              YourCardInRowWidget(taskName: 'Bath', isCompleted: true,),
              YourCardInRowWidget(taskName: 'Eat', isCompleted: true,),
            ],
          ),
        ],
      ),
    ),
    );
  }
}

class YourBarGraphWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: [
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(color: Colors.blue, toY: 7),
              BarChartRodData(color: Colors.green, toY: 9),
              BarChartRodData( color: Colors.red, toY: 12),
            ],
          ),
          // Add more BarChartGroupData with sample data as needed
        ],
      ),
    );
  }
}

class YourPieChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            title: 'A',
            value: 30,
            color: Colors.blue,
          ),
          PieChartSectionData(
            title: 'B',
            value: 40,
            color: Colors.green,
          ),
          PieChartSectionData(
            title: 'C',
            value: 30,
            color: Colors.red,
          ),
          // Add more PieChartSectionData with sample data as needed
        ],
      ),
    );
  }
}

class YourCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final int priority;

  YourCardWidget({required this.title, required this.description, required this.priority});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        trailing: Text('Priority: $priority'),
      ),
    );
  }
}

class YourCardInRowWidget extends StatelessWidget {
  final String taskName;
  final bool isCompleted;

  YourCardInRowWidget({required this.taskName, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Icon(
            isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isCompleted ? Colors.green : Colors.red,
          ),
          SizedBox(width: 8),
          Text(taskName),
        ],
      ),
    );
  }
}
