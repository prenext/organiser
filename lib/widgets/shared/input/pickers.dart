import 'package:flutter/material.dart';

class DatePickerUtil {
  static Future<DateTime?> pickDate(
      BuildContext context, DateTime initialDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    return pickedDate;
  }
}
