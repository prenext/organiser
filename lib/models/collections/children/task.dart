import 'package:cloud_firestore/cloud_firestore.dart';

enum RepeatInterval {
  daily,
  weekly,
  monthly,
  yearly,
}

enum DoTime {
  morning,
  afternoon,
  evening,
  custom,
}

class Task {
  String id; // Unique identifier for the task
  String title;
  String description;
  Map<String, bool> subtasks; // Map of subtask names to their completion status
  DateTime doDay; // Date when the task should be done
  DoTime
      doTime; // Time when the task should be done (morning, afternoon, evening, custom)
  int priority; // Priority level (1 - 3)
  String category;
  bool repeat; // Whether the task should be repeated
  RepeatInterval
      repeatInterval; // Interval for repeating (daily, weekly, monthly, yearly)
  int repeatCount; // How many times to repeat

  // Constructor
  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.subtasks,
    required this.doDay,
    required this.doTime,
    required this.priority,
    required this.category,
    required this.repeat,
    required this.repeatInterval,
    required this.repeatCount,
  });

  // Factory constructor to create a Task instance from a Firebase snapshot
  factory Task.fromMap(Map<String, dynamic> data, String documentId) {
    return Task(
      id: documentId,
      title: data['title'],
      description: data['description'],
      subtasks: Map<String, bool>.from(data['subtasks']),
      doDay: (data['doDay'] as Timestamp)
          .toDate(), // Assuming Firestore Timestamp is used
      doTime: _getDoTimeFromString(data['doTime']),
      priority: data['priority'],
      category: data['category'],
      repeat: data['repeat'],
      repeatInterval: _getRepeatIntervalFromString(data['repeatInterval']),
      repeatCount: data['repeatCount'],
    );
  }

  // Method to convert Task instance to a map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'subtasks': subtasks,
      'doDay':
          doDay, // You may need to convert this to a Firestore Timestamp if needed
      'doTime': doTime.toString().split('.').last, // Convert enum to string
      'priority': priority,
      'category': category,
      'repeat': repeat,
      'repeatInterval':
          repeatInterval.toString().split('.').last, // Convert enum to string
      'repeatCount': repeatCount,
    };
  }

  // Helper method to convert string to DoTime enum
  static DoTime _getDoTimeFromString(String doTimeString) {
    switch (doTimeString.toLowerCase()) {
      case 'morning':
        return DoTime.morning;
      case 'afternoon':
        return DoTime.afternoon;
      case 'evening':
        return DoTime.evening;
      default:
        return DoTime.custom;
    }
  }

  // Helper method to convert string to RepeatInterval enum
  static RepeatInterval _getRepeatIntervalFromString(
      String repeatIntervalString) {
    switch (repeatIntervalString.toLowerCase()) {
      case 'daily':
        return RepeatInterval.daily;
      case 'weekly':
        return RepeatInterval.weekly;
      case 'monthly':
        return RepeatInterval.monthly;
      case 'yearly':
        return RepeatInterval.yearly;
      default:
        return RepeatInterval.daily; // Default to daily if not recognized
    }
  }
}
