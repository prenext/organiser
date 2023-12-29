import 'package:cloud_firestore/cloud_firestore.dart';

enum ReferenceType {
  task,
  event,
  schedule,
  meal,
}

class Goal {
  String id; // Unique identifier for the goal
  String title;
  String description;
  String timeframe;
  String category;
  int priority;
  Map<ReferenceType, List<DocumentReference>> references;

  // Constructor
  Goal({
    required this.id,
    required this.title,
    required this.description,
    required this.timeframe,
    required this.category,
    required this.priority,
    required this.references,
  });

  // Factory constructor to create a Goal instance from a Firebase snapshot
  factory Goal.fromMap(Map<String, dynamic> data, String documentId) {
    return Goal(
      id: documentId,
      title: data['title'],
      description: data['description'],
      timeframe: data['timeframe'],
      category: data['category'],
      priority: data['priority'],
      references: _convertReferences(data['references']),
    );
  }

  // Method to convert Goal instance to a map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'timeframe': timeframe,
      'category': category,
      'priority': priority,
      'references': _convertReferencesToMap(references),
    };
  }

  // Helper method to convert Firestore references to a map for Firebase
  static Map<String, List<String>> _convertReferencesToMap(
      Map<ReferenceType, List<DocumentReference>> references) {
    final Map<String, List<String>> referencesMap = {};

    references.forEach((type, refs) {
      final List<String> refIds = refs.map((ref) => ref.id).toList();
      referencesMap[type.toString().split('.').last] = refIds;
    });

    return referencesMap;
  }

  // Helper method to convert map of reference IDs to Firestore references
  static Map<ReferenceType, List<DocumentReference>> _convertReferences(
      Map<String, dynamic> referencesMap) {
    final Map<ReferenceType, List<DocumentReference>> references = {};

    referencesMap.forEach((typeString, refIds) {
      final type = _getReferenceTypeFromString(typeString);
      final List<DocumentReference> refs = (refIds as List<dynamic>)
          .map(
              (id) => FirebaseFirestore.instance.collection(typeString).doc(id))
          .toList();
      references[type] = refs;
    });

    return references;
  }

  // Helper method to convert string to ReferenceType enum
  static ReferenceType _getReferenceTypeFromString(String typeString) {
    switch (typeString.toLowerCase()) {
      case 'task':
        return ReferenceType.task;
      case 'event':
        return ReferenceType.event;
      case 'schedule':
        return ReferenceType.schedule;
      case 'meal':
        return ReferenceType.meal;
      default:
        throw ArgumentError('Invalid ReferenceType: $typeString');
    }
  }
}
