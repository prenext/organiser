import 'package:Organiser/views/widgets/styled/input_adder/date.dart';
import 'package:Organiser/views/widgets/styled/input_adder/time.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DateAndTimeAdder extends StatefulWidget {
  final Map<DateTime, TimeOfDay> dateAndTimeController;
  DateTime? dateController;
  DateTime? endDateController;
  TimeOfDay? startTimeController;
  TimeOfDay? endTimeController;
  bool isMultiDay = true;

  DateAndTimeAdder({required this.dateAndTimeController});

  @override
  _DateAndTimeAdder createState() => _DateAndTimeAdder();
}

class _DateAndTimeAdder extends State<DateAndTimeAdder>{

   Widget build(BuildContext context) {
    return Column(
      children: [
        DateAdder(
          dateController: widget.dateController,
          endDateController: widget.endDateController,
          isMultiDayController: widget.isMultiDay,
        ),
        SizedBox(height: 16.0,),
        TimeAdder(
          isMultiDay: widget.isMultiDay,
          isDuration: true,
          startTimeController: widget.startTimeController,
          endTimeController: widget.endTimeController,
          canBeMultiDay: true,
        ),
      ],
    );
  }

}
