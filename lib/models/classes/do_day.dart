import 'package:Organiser/models/enums/time_enums.dart';

class DoDay {
  DateTime? tangibleValue;

  DoDay({this.tangibleValue});

  factory DoDay.fromEnum(DoDayEnum day, {DayOfWeek? dayName}) {
    switch (day) {
      case DoDayEnum.today:
        return DoDay(tangibleValue: DateTime.now());
      case DoDayEnum.tomorrow:
        return DoDay(tangibleValue: DateTime.now().add(Duration(days: 1)));
      case DoDayEnum.weekDay:
        if (dayName != null) {
          return DoDay(tangibleValue: getDateForDay(dayName));
        }
        return DoDay();
      default:
        return DoDay();
    }
  }

  dynamic getEnumValue() {
    return tangibleValue;
  }

  dynamic getTangibleValue() {
    return tangibleValue;
  }

  void setCustomValue(dynamic value) {
    if (value is DateTime) {
      tangibleValue = value;
    } else {
      tangibleValue = null;
    }
  }

  static DateTime getDateForDay(DayOfWeek dayName) {
    final int targetDayIndex = dayName.index + 1;
    final DateTime now = DateTime.now();
    final int currentDayIndex = now.weekday;
    final int daysDifference = (targetDayIndex - currentDayIndex + 7) % 7;
    final DateTime targetDate = now.add(Duration(days: daysDifference));
    return targetDate;
  }

  static String formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  String toText() {
    if (tangibleValue == null) {
      return 'No date set';
    }

    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime targetDate = DateTime(tangibleValue!.year, tangibleValue!.month, tangibleValue!.day);

    if (targetDate == today) {
      return 'Today';
    } else if (targetDate == today.add(Duration(days: 1))) {
      return 'Tomorrow';
    } else if (targetDate == today.subtract(Duration(days: 1))) {
      return 'Yesterday';
    } else if (targetDate.isAfter(today.subtract(Duration(days: 7))) && targetDate.isBefore(today)) {
      return 'Last ${dayOfWeek(targetDate.weekday)}';
    } else if (targetDate.isAfter(today) && targetDate.isBefore(today.add(Duration(days: 7)))) {
      return 'This ${dayOfWeek(targetDate.weekday)}';
    } else if (targetDate.isAfter(today.add(Duration(days: 7))) && targetDate.isBefore(today.add(Duration(days: 14)))) {
      return 'Next ${dayOfWeek(targetDate.weekday)}';
    } else if (targetDate.month == now.month + 1 && targetDate.year == now.year) {
      return 'Next month';
    } else if (targetDate.year == now.year + 1) {
      return 'Next year';
    } else if (targetDate.month == now.month - 1 && targetDate.year == now.year) {
      return 'Last month';
    } else if (targetDate.year == now.year - 1) {
      return 'Last year';
    } else {
      return 'On ${formatDate(tangibleValue!)}';
    }
  }

  String dayOfWeek(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      case DateTime.sunday:
        return 'Sunday';
      default:
        return '';
    }
  }
}
