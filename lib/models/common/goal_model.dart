class Goal {
  String id;
  String title;
  String description;
  String timeframe;
  String category;
  int priority;
  List<String> tags;
  List<Map<String, String>> media;
  List<String> tasks;
  List<String> meals;
  List<String> schedules;
  List<String> events;

  Goal({
    required this.id,
    required this.title,
    required this.description,
    required this.timeframe,
    required this.category,
    required this.priority,
    this.tags = const [],
    this.media = const [],
    this.tasks = const [],
    this.meals = const [],
    this.schedules = const [],
    this.events = const [],
  });

  factory Goal.fromMap(Map<String, dynamic> data, String documentId) {
    return Goal(
      id: documentId,
      title: data['title'],
      description: data['description'],
      timeframe: data['timeframe'],
      category: data['category'],
      priority: data['priority'],
      tags: List<String>.from(data['tags'] ?? []),
      media: List<Map<String, String>>.from(data['media'] ?? []),
      tasks: List<String>.from(data['tasks'] ?? []),
      meals: List<String>.from(data['meals'] ?? []),
      schedules: List<String>.from(data['schedules'] ?? []),
      events: List<String>.from(data['events'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'timeframe': timeframe,
      'category': category,
      'priority': priority,
      'tags': tags,
      'media': media,
      'tasks': tasks,
      'meals': meals,
      'schedules': schedules,
      'events': events,
    };
  }
}
