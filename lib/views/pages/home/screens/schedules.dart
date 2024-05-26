import 'package:Organiser/views/widgets/common/custom_appbar.dart';
import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';

class Schedules extends StatefulWidget {
  const Schedules({Key? key}) : super(key: key);

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CustomAppBar(
        leadingWidth: 0,
        leading: Text(""),
        centerTitle: false,
        title: Text("Calendar"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        ],
      ),
      body: _buildSchedulesView(),
    );
  }

  Widget _buildSchedulesView() {
    return Center(
      child: Text('Schedules  View'),
    );
  }
}
