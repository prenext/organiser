
enum MealType {
  fastFood,
  breakfast,
  lunch,
  supper,
  snack,
}

enum RepeatFrequency {
  daily,
  weekly,
  monthly,
}

class Meal {
  String id; // Unique identifier for the meal
  String title;
  String description;
  Map<String, double> nutrients; // Map of nutrients and their values
  int calories;
  MealType type;
  List<String> contents; // List of ingredients or contents
  bool repeat;
  RepeatFrequency repeatFrequency;
  double cost;

  // Constructor
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

  // Factory constructor to create a Meal instance from a Firebase snapshot
  factory Meal.fromMap(Map<String, dynamic> data, String documentId) {
    return Meal(
      id: documentId,
      title: data['title'],
      description: data['description'],
      nutrients: Map<String, double>.from(data['nutrients']),
      calories: data['calories'],
      type: _getMealTypeFromString(data['type']),
      contents: List<String>.from(data['contents']),
      repeat: data['repeat'],
      repeatFrequency: _getRepeatFrequencyFromString(data['repeatFrequency']),
      cost: data['cost'].toDouble(),
    );
  }

  // Method to convert Meal instance to a map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'nutrients': nutrients,
      'calories': calories,
      'type': type.toString().split('.').last, // Convert enum to string
      'contents': contents,
      'repeat': repeat,
      'repeatFrequency':
          repeatFrequency.toString().split('.').last, // Convert enum to string
      'cost': cost,
    };
  }

  // Helper method to convert string to MealType enum
  static MealType _getMealTypeFromString(String mealTypeString) {
    switch (mealTypeString.toLowerCase()) {
      case 'fastfood':
        return MealType.fastFood;
      case 'breakfast':
        return MealType.breakfast;
      case 'lunch':
        return MealType.lunch;
      case 'supper':
        return MealType.supper;
      case 'snack':
        return MealType.snack;
      default:
        return MealType.fastFood; // Default to fast food if not recognized
    }
  }

  // Helper method to convert string to RepeatFrequency enum
  static RepeatFrequency _getRepeatFrequencyFromString(
      String repeatFrequencyString) {
    switch (repeatFrequencyString.toLowerCase()) {
      case 'daily':
        return RepeatFrequency.daily;
      case 'weekly':
        return RepeatFrequency.weekly;
      case 'monthly':
        return RepeatFrequency.monthly;
      default:
        return RepeatFrequency.daily; // Default to daily if not recognized
    }
  }
}
