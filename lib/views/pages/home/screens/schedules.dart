import 'package:Organiser/views/widgets/common/tabs_appbar.dart';
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: TabsAppBar(
          tabs: [
            Tab(text: 'Schedules'),
            Tab(
              text: 'Events',
            ),
          ],
        ),
        body: TabBarView(
          children: [
            _buildSchedulesView(),
            _buildEventsView(),
          ],
        ),
      ),
    );
  }

  Widget _buildSchedulesView() {
    return Center(
      child: Text('Schedules  View'),
    );
  }

  Widget _buildEventsView() {
    // You can customize this view for displaying events
    return Center(
      child: Text('Events View'),
    );
  }
}
