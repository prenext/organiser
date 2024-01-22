import 'package:cloud_firestore/cloud_firestore.dart';

enum RepeatType {
  daily,
  weekly,
  monthly,
  yearly,
  custom,
}

class Schedule {
  String id; // Unique identifier for the schedule
  String title;
  String description;
  List<int> doDays; // List of days of the week (0 - 6, where 0 is Sunday)
  DateTime? customDate; // Custom date if repeat type is custom
  Duration duration;
  bool repeat;
  RepeatType repeatType;
  int priority;
  String category;

  // Constructor
  Schedule({
    required this.id,
    required this.title,
    required this.description,
    required this.doDays,
    this.customDate,
    required this.duration,
    required this.repeat,
    required this.repeatType,
    required this.priority,
    required this.category,
  });

  // Factory constructor to create a Schedule instance from a Firebase snapshot
  factory Schedule.fromMap(Map<String, dynamic> data, String documentId) {
    return Schedule(
      id: documentId,
      title: data['title'],
      description: data['description'],
      doDays: List<int>.from(data['doDays']),
      customDate: (data['customDate'] as Timestamp).toDate(),
      duration: Duration(minutes: data['duration']),
      repeat: data['repeat'],
      repeatType: _getRepeatTypeFromString(data['repeatType']),
      priority: data['priority'],
      category: data['category'],
    );
  }

  // Method to convert Schedule instance to a map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'doDays': doDays,
      'customDate':
          customDate, // You may need to convert this to a Firestore Timestamp if needed
      'duration': duration.inMinutes,
      'repeat': repeat,
      'repeatType':
          repeatType.toString().split('.').last, // Convert enum to string
      'priority': priority,
      'category': category,
    };
  }

  // Helper method to convert string to RepeatType enum
  static RepeatType _getRepeatTypeFromString(String repeatTypeString) {
    switch (repeatTypeString.toLowerCase()) {
      case 'daily':
        return RepeatType.daily;
      case 'weekly':
        return RepeatType.weekly;
      case 'monthly':
        return RepeatType.monthly;
      case 'yearly':
        return RepeatType.yearly;
      case 'custom':
        return RepeatType.custom;
      default:
        return RepeatType.daily; // Default to daily if not recognized
    }
  }
}
