import 'package:Organiser/models/classes/do_day.dart';
import 'package:Organiser/models/classes/do_time.dart';
import 'package:Organiser/models/classes/repeat_interval.dart';
import 'package:Organiser/models/classes/repeat_type.dart';
import 'package:Organiser/models/common/media_model.dart';
import 'package:Organiser/models/enums/task_enums.dart';

class Task {
  String id;
  String title;
  String hashtags;
  String description;
  DoDay doDay;
  DoTime doTime;
  TaskPriority priority;
  bool repeat;
  RepeatInterval? repeatInterval;
  RepeatType? repeatType;
  List<MediaType>? attachments;
  Map<String, TaskStatus>? subtasks;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.doDay,
    required this.doTime,
    required this.priority,
    required this.hashtags,
    required this.repeat,
    required this.repeatInterval,
    required this.repeatType,
    this.attachments,
    this.subtasks,
  });

  // Factory constructor to create a Task instance from a Firebase snapshot
  factory Task.fromMap(Map<String, dynamic> data, String documentId) {
    return Task(
      id: documentId,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      subtasks: (data['subtasks'] != null)
          ? Map<String, TaskStatus>.from(data['subtasks'])
          : null,
      doDay: DoDay(tangibleValue: data['doDay']),
      doTime: DoTime(tangibleValue: data['doTime']),
      priority: (data['priority'] != null)
          ? TaskPriority.values[data['priority']]
          : TaskPriority.low,
      hashtags: data['hashtags'] ?? '',
      repeat: data['repeat'] ?? false,
      repeatInterval: RepeatInterval(
        type: data['repeatInterval']['type'],
        every: data['repeatInterval']['every'],
      ),
      repeatType: RepeatType(
        type: data['repeatType']['type'],
        value: data['repeatType']['value'],
      ),
      attachments: (data['attachments'] != null)
          ? List<MediaType>.from(
              data['attachments'].map((item) => MediaType.fromJson(item)))
          : null,
    );
  }

  // Method to convert Task instance to a map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'subtasks': subtasks,
      'doDay': doDay.tangibleValue,
      'doTime': doTime.tangibleValue,
      'priority': priority.index,
      'hashtags': hashtags,
      'repeat': repeat,
      'repeatInterval': repeatInterval?.toMap(),
      'repeatType': repeatType?.toMap(),
      'attachments': attachments?.map((media) => media.toJson()).toList(),
    };
  }
}
