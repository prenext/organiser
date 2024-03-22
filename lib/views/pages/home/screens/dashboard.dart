import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

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
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Activity Overview',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Tasks',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 10,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "This Week",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Expanded(child: Container(child: MyLineChart())),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Wrap(
                            spacing: 10.0,
                            direction: Axis.horizontal,
                            children: [
                              CustomFilterChip(
                                label: 'Today',
                                selected: selectedFilter == 'Today',
                                onSelected: (value) {
                                  setState(() {
                                    selectedFilter = 'Today';
                                  });
                                },
                              ),
                              CustomFilterChip(
                                label: 'Yesterday',
                                selected: selectedFilter == 'Yesterday',
                                onSelected: (value) {
                                  setState(() {
                                    selectedFilter = 'Yesterday';
                                  });
                                },
                              ),
                              CustomFilterChip(
                                label: 'This Week',
                                selected: selectedFilter == 'This Week',
                                onSelected: (value) {
                                  setState(() {
                                    selectedFilter = 'This Week';
                                  });
                                },
                              ),
                              CustomFilterChip(
                                label: 'This Month',
                                selected: selectedFilter == 'This Month',
                                onSelected: (value) {
                                  setState(() {
                                    selectedFilter = 'This Month';
                                  });
                                },
                              ),
                              CustomFilterChip(
                                label: 'This Year',
                                selected: selectedFilter == 'This Year',
                                onSelected: (value) {
                                  setState(() {
                                    selectedFilter = 'This Year';
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Goals Progress',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Add a spacer
                        Spacer(),
                        IconButton(
                            onPressed: () => {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ))
                      ],
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Buy a new car",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  )),
                              Spacer(),
                              Text("50%",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                          LinearProgressIndicator(
                            value: 0.9,
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.green),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Learn Data Science",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  )),
                              Spacer(),
                              Text("70%",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                          LinearProgressIndicator(
                            value: 0.7,
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.amber),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Build Organiser App",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  )),
                              Spacer(),
                              Text("30%",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                          LinearProgressIndicator(
                            value: 0.3,
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text("You're on track to achieve your goals",
                        style: TextStyle(
                          fontSize: 12.0,
                        )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                height: 700,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to Organiser',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Organise your life with ease',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomFilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final Function(bool) onSelected;

  const CustomFilterChip({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 4.0, vertical: 0.0), // Adjust padding as needed
        child: Text(label),
      ),
      side: BorderSide(
        color: Theme.of(context)
            .primaryColor
            .withOpacity(0.5), // Use theme primary color for border
        width: 0.5, // Adjust border width as needed
      ),
      selected: selected,
      onSelected: onSelected,
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
          color: Theme.of(context)
              .primaryColor), // Use theme primary color for label text
    );
  }
}

class MyLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: false,
          drawVerticalLine: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Color.fromARGB(0, 55, 67, 77),
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Color.fromARGB(0, 55, 67, 77),
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Color.fromARGB(0, 55, 67, 77), width: 1),
        ),
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 6,
        backgroundColor: Colors.transparent,
        titlesData: FlTitlesData(
            topTitles: AxisTitles(drawBelowEverything: true),
            rightTitles: AxisTitles(drawBelowEverything: true),
            leftTitles: AxisTitles()),
        lineBarsData: [
          // First line
          LineChartBarData(
            spots: [
              FlSpot(0, 3),
              FlSpot(2.6, 4),
              FlSpot(9.5, 4),
              FlSpot(11, 6),
            ],
            color: Colors.green,
            show: true,
            isCurved: true,
            barWidth: 2,
            isStrokeCapRound: false,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: false,
            ),
          ),
          // Second line
          LineChartBarData(
            spots: [
              FlSpot(0, 2),
              FlSpot(6.8, 3),
              FlSpot(11, 3),
            ],
            color: Colors.yellow,
            show: true,
            isCurved: true,
            barWidth: 2,
            isStrokeCapRound: false,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: false,
            ),
          ),
          // Third line
          LineChartBarData(
            spots: [
              FlSpot(0, 0),
              FlSpot(6.8, 1),
              FlSpot(11, 0),
            ],
            color: Colors.red,
            show: true,
            isCurved: true,
            barWidth: 2,
            isStrokeCapRound: false,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: false,
            ),
          ),
        ],
      ),
    );
  }
}
