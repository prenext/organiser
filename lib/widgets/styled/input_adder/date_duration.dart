import 'package:Organiser/widgets/styled/input_adder/date.dart';
import 'package:Organiser/widgets/styled/input_adder/time.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DateAndTimeAdder extends StatelessWidget {
  final Map<DateTime, TimeOfDay> dateAndTimeController;
  final DateTime _dateController = DateTime(1);
  final DateTime _endDateController = DateTime(1);
  final TimeOfDay _startTimeController = TimeOfDay(hour: 1, minute: 1);
  final TimeOfDay _endTimeController = TimeOfDay(hour: 1, minute: 1);
  bool isMultiDay = false;

  DateAndTimeAdder({required this.dateAndTimeController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateAdder(
          dateController: _dateController,
          endDateController: _endDateController,
          isMultiDayController: isMultiDay,
        ),
        TimeAdder(
          isMultiDay: isMultiDay,
          isDuration: true,
          startTimeController: _startTimeController,
          endTimeController: _endTimeController,
        ),
      ],
    );
  }
}
