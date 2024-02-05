import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Schedules extends StatefulWidget {
  const Schedules({Key? key}) : super(key: key);

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Calendars'),
        bottom: TabBar(
          labelColor: Theme.of(context).colorScheme.primary,
          indicatorColor: Theme.of(context).colorScheme.primary,
          unselectedLabelColor: Theme.of(context).hintColor,
          controller: _tabController,
          tabs: [
            Tab(text: 'Schedules'),
            Tab(text: 'Events',),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildSchedulesView(),
          _buildEventsView(),
        ],
      ),
    );
  }

  Widget _buildSchedulesView() {
    return SfCalendar(
      view: CalendarView.timelineWeek,
      dataSource: _getCalendarDataSource(),
    );
  }

  Widget _buildEventsView() {
    // You can customize this view for displaying events
    return Center(
      child: Text('Events View'),
    );
  }

  // Method to create a data source for the calendar
  _DataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];

    // Add your events to the list of appointments
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 2)),
      subject: 'Meeting 1',
      color: Colors.blue,
    ));

    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: 1)),
      endTime: DateTime.now().add(Duration(days: 1, hours: 1)),
      subject: 'Meeting 2',
      color: Colors.green,
    ));

    // Return the data source
    return _DataSource(appointments);
  }
}

// Data source class
class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
