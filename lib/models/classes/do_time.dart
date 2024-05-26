import 'package:Organiser/models/enums/time_enums.dart';
import 'package:flutter/material.dart';

class DoTime {
  TimeOfDay? tangibleValue;

  DoTime({this.tangibleValue});

  factory DoTime.fromEnum(DoTimeEnum time) {
    switch (time) {
      case DoTimeEnum.morning:
        return DoTime(tangibleValue: TimeOfDay(hour: 8, minute: 0));
      case DoTimeEnum.noon:
        return DoTime(tangibleValue: TimeOfDay(hour: 12, minute: 0));
      case DoTimeEnum.afternoon:
        return DoTime(tangibleValue: TimeOfDay(hour: 14, minute: 0));
      case DoTimeEnum.evening:
        return DoTime(tangibleValue: TimeOfDay(hour: 19, minute: 0));
      case DoTimeEnum.night:
        return DoTime(tangibleValue: TimeOfDay(hour: 21, minute: 0));
      case DoTimeEnum.midnight:
        return DoTime(tangibleValue: TimeOfDay(hour: 0, minute: 0));
      case DoTimeEnum.none:
        return DoTime();
      default:
        return DoTime();
    }
  }

  TimeOfDay? getEnumValue() {
    return tangibleValue;
  }

  TimeOfDay? getTangibleValue() {
    return tangibleValue;
  }

  void setCustomValue(TimeOfDay value) {
    tangibleValue = value;
  }

  String toText(BuildContext context) {
    if (tangibleValue == null) {
      return 'No time set';
    }

    if (tangibleValue == TimeOfDay(hour: 8, minute: 0)) {
      return 'Morning';
    } else if (tangibleValue == TimeOfDay(hour: 12, minute: 0)) {
      return 'Noon';
    } else if (tangibleValue == TimeOfDay(hour: 14, minute: 0)) {
      return 'Afternoon';
    } else if (tangibleValue == TimeOfDay(hour: 19, minute: 0)) {
      return 'Evening';
    } else if (tangibleValue == TimeOfDay(hour: 21, minute: 0)) {
      return 'Night';
    } else if (tangibleValue == TimeOfDay(hour: 0, minute: 0)) {
      return 'Midnight';
    } else {
      return 'At ${tangibleValue!.format(context)}';
    }
  }
}
