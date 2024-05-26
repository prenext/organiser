import 'package:Organiser/models/enums/time_enums.dart';

class RepeatType {
  RepeatTypeEnum type;
  dynamic value;

  RepeatType({
    required this.type,
    this.value,
  }) {
    if (type == RepeatTypeEnum.repeatCount && (value == null || value <= 1)) {
      throw ArgumentError('Repeat count must be greater than one.');
    }
    if (type == RepeatTypeEnum.repeatUntil && value == null) {
      throw ArgumentError('Repeat until date must be provided.');
    }
  }

  // Convert RepeatType object to a map (for Firestore or other storage)
  Map<String, dynamic> toMap() {
    return {
      'type': type.toString().split('.').last,
      'value': value,
    };
  }

  // Create RepeatType object from map (e.g., Firestore document snapshot data)
  factory RepeatType.fromMap(Map<String, dynamic> map) {
    return RepeatType(
      type: _parseRepeatTypeEnum(map['type']),
      value: map['value'],
    );
  }

  // Utility function to convert string to RepeatTypeEnum
  static RepeatTypeEnum _parseRepeatTypeEnum(String typeString) {
    switch (typeString.toLowerCase()) {
      case 'repeatuntil':
        return RepeatTypeEnum.repeatUntil;
      case 'repeatcount':
        return RepeatTypeEnum.repeatCount;
      case 'infinite':
        return RepeatTypeEnum.infinite;
      default:
        throw ArgumentError('Unknown RepeatTypeEnum type: $typeString');
    }
  }

  RepeatTypeEnum getType() {
    return type;
  }

  dynamic getValue() {
    return value;
  }

  void setType(RepeatTypeEnum newType) {
    type = newType;
  }

  void setValue(dynamic newValue) {
    if (type == RepeatTypeEnum.repeatCount && (newValue == null || newValue <= 1)) {
      throw ArgumentError('Repeat count must be greater than one.');
    }
    if (type == RepeatTypeEnum.repeatUntil && newValue == null) {
      throw ArgumentError('Repeat until date must be provided.');
    }
    value = newValue;
  }

  String toText() {
    switch (type) {
      case RepeatTypeEnum.repeatUntil:
        return 'Repeat until ${value.toString()}';
      case RepeatTypeEnum.repeatCount:
        return 'Repeat ${value.toString()} times';
      case RepeatTypeEnum.infinite:
        return 'Repeat indefinitely';
      default:
        return 'No repeat type';
    }
  }
}
