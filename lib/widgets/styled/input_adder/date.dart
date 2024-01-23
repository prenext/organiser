// date_picker.dart
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DateAdder extends StatelessWidget {
  final DateTime? dateController;
  final DateTime? startDateController;
  final DateTime? endDateController;
  final bool isMultiDayController;

  DateAdder({
    this.dateController,
    this.endDateController,
    this.startDateController,
    required this.isMultiDayController,
  });

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: dateController!,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != dateController) {
      onDateSelected(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        margin: EdgeInsets.zero,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'BEGIN:',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Selected Date:',
                            style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ENDS:',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Selected Date:',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Theme.of(context).hintColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Multiple Days'),
                  Switch(
                    value: this.isMultiDayController,
                    onChanged: (bool newValue) {
                      // Handle the state change in the parent widget
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void onDateSelected(DateTime pickedDate) {}
