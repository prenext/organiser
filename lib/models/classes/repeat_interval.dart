import 'package:Organiser/models/enums/time_enums.dart';

class RepeatInterval {
  RepeatIntervalEnum type;
  int every;

  RepeatInterval({
    required this.type,
    this.every = 1,
  }) {
    if (every <= 0) {
      throw ArgumentError('Repeat interval must be greater than zero.');
    }
  }

  // Convert RepeatInterval object to a map (for Firestore or other storage)
  Map<String, dynamic> toMap() {
    return {
      'type': type.toString().split('.').last,
      'every': every,
    };
  }

  // Create RepeatInterval object from map (e.g., Firestore document snapshot data)
  factory RepeatInterval.fromMap(Map<String, dynamic> map) {
    return RepeatInterval(
      type: _parseRepeatIntervalEnum(map['type']),
      every: map['every'] ?? 1,
    );
  }

  // Utility function to convert string to RepeatIntervalEnum
  static RepeatIntervalEnum _parseRepeatIntervalEnum(String typeString) {
    switch (typeString.toLowerCase()) {
      case 'daily':
        return RepeatIntervalEnum.daily;
      case 'weekly':
        return RepeatIntervalEnum.weekly;
      case 'monthly':
        return RepeatIntervalEnum.monthly;
      case 'yearly':
        return RepeatIntervalEnum.yearly;
      default:
        throw ArgumentError('Unknown RepeatIntervalEnum type: $typeString');
    }
  }

  RepeatIntervalEnum getType() {
    return type;
  }

  int getEvery() {
    return every;
  }

  void setType(RepeatIntervalEnum newType) {
    type = newType;
  }

  void setEvery(int newEvery) {
    if (newEvery <= 0) {
      throw ArgumentError('Repeat interval must be greater than zero.');
    }
    every = newEvery;
  }

  String toText() {
    return 'Every $every ${type.toString().split('.').last}';
  }
}
