import 'package:Organiser/models/classes/repeat_interval.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Schedule {
  String id;
  String title;
  String description;
  List<int> doDays;
  DateTime? customDate;
  Duration duration;
  bool repeat;
  RepeatInterval repeatType;
  int priority;
  String category;

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

  factory Schedule.fromMap(Map<String, dynamic> data, String documentId) {
    return Schedule(
      id: documentId,
      title: data['title'],
      description: data['description'],
      doDays: List<int>.from(data['doDays']),
      customDate: (data['customDate'] as Timestamp?)?.toDate(),
      duration: Duration(minutes: data['duration']),
      repeat: data['repeat'],
      repeatType: data['repeatType'],
      priority: data['priority'],
      category: data['category'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'doDays': doDays,
      'customDate': customDate,
      'duration': duration.inMinutes,
      'repeat': repeat,
      'repeatType': repeatType.toString().split('.').last,
      'priority': priority,
      'category': category,
    };
  }
}
