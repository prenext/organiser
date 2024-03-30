import 'package:Organiser/models/enums/meal_enums.dart';
import 'package:Organiser/models/enums/time_enums.dart';

class Meal {
  String id;
  String title;
  String description;
  Map<String, double> nutrients;
  int calories;
  MealType type;
  List<String> contents;
  bool repeat;
  RepeatFrequency repeatFrequency;
  double cost;

  Meal({
    required this.id,
    required this.title,
    required this.description,
    required this.nutrients,
    required this.calories,
    required this.type,
    required this.contents,
    required this.repeat,
    required this.repeatFrequency,
    required this.cost,
  });

  factory Meal.fromMap(Map<String, dynamic> data, String documentId) {
    return Meal(
      id: documentId,
      title: data['title'],
      description: data['description'],
      nutrients: Map<String, double>.from(data['nutrients']),
      calories: data['calories'],
      type: MealType.values
          .firstWhere((e) => e.toString().split('.').last == data['type']),
      contents: List<String>.from(data['contents']),
      repeat: data['repeat'],
      repeatFrequency: RepeatFrequency.values.firstWhere(
          (e) => e.toString().split('.').last == data['repeatFrequency']),
      cost: data['cost'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'nutrients': nutrients,
      'calories': calories,
      'type': type.toString().split('.').last,
      'contents': contents,
      'repeat': repeat,
      'repeatFrequency': repeatFrequency.toString().split('.').last,
      'cost': cost,
    };
  }
}
