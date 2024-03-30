import 'package:Organiser/models/enums/time_enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String id;
  String title;
  String description;
  Map<String, bool> subtasks;
  DateTime doDay;
  DoTime doTime;
  int priority;
  String category;
  bool repeat;
  RepeatInterval repeatInterval;
  int repeatCount;

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
      doDay: (data['doDay'] as Timestamp).toDate(),
      doTime: DoTime.values
          .firstWhere((e) => e.toString().split('.').last == data['doTime']),
      priority: data['priority'] ?? 0,
      category: data['category'] ?? '',
      repeat: data['repeat'] ?? false,
      repeatInterval: RepeatInterval.values.firstWhere(
          (e) => e.toString().split('.').last == data['repeatInterval']),
      repeatCount: data['repeatCount'] ?? 0,
    );
  }

  // Method to convert Task instance to a map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'subtasks': subtasks,
      'doDay': doDay,
      'doTime': doTime.toString().split('.').last,
      'priority': priority,
      'category': category,
      'repeat': repeat,
      'repeatInterval': repeatInterval.toString().split('.').last,
      'repeatCount': repeatCount,
    };
  }
}
