import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum ReferenceType {
  task,
  event,
  schedule,
  meal,
}

class Event {
  String id; // Unique identifier for the event
  String title;
  String description;
  DateTime date;
  TimeOfDay startTime;
  TimeOfDay endTime;
  String category;
  List<String> tags;
  bool isRepeating;
  String
      repeatFrequency; // String for repeat frequency, e.g., 'daily', 'weekly'
  bool isMultiDayEvent;
  int numberOfDays;

  // Constructor
  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.category,
    required this.tags,
    required this.isRepeating,
    required this.repeatFrequency,
    required this.isMultiDayEvent,
    required this.numberOfDays,
  });

  // Factory constructor to create an Event instance from a Firebase snapshot
  factory Event.fromMap(Map<String, dynamic> data, String documentId) {
    return Event(
      id: documentId,
      title: data['title'],
      description: data['description'],
      date: (data['date'] as Timestamp).toDate(),
      startTime:
          TimeOfDay.fromDateTime((data['startTime'] as Timestamp).toDate()),
      endTime: TimeOfDay.fromDateTime((data['endTime'] as Timestamp).toDate()),
      category: data['category'],
      tags: List<String>.from(data['tags']),
      isRepeating: data['isRepeating'],
      repeatFrequency: data['repeatFrequency'],
      isMultiDayEvent: data['isMultiDayEvent'],
      numberOfDays: data['numberOfDays'],
    );
  }

  // Method to convert Event instance to a map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'date':
          date, // You may need to convert this to a Firestore Timestamp if needed
      'startTime':
          startTime, // You may need to convert this to a Firestore Timestamp if needed
      'endTime':
          endTime, // You may need to convert this to a Firestore Timestamp if needed
      'category': category,
      'tags': tags,
      'isRepeating': isRepeating,
      'repeatFrequency': repeatFrequency,
      'isMultiDayEvent': isMultiDayEvent,
      'numberOfDays': numberOfDays,
    };
  }
}
