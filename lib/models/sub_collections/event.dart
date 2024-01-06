import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum ReferenceType {
  task,
  event,
  schedule,
  meal,
}

class Event with ChangeNotifier {
  String id;
  String title;
  String description;
  DateTime startDate;
  DateTime endDate;
  List<Map<String, TimeOfDay>> timeMap;
  String category;
  List<String> tags;
  bool isRepeating;
  String repeatFrequency;
  bool isMultiDayEvent;
  bool sameEachDay;
  String location;
  double ticketCost;
  int numberOfTickets;
  String photoURL;

  // Constructor
  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.timeMap,
    required this.category,
    required this.tags,
    required this.isRepeating,
    required this.repeatFrequency,
    required this.isMultiDayEvent,
    required this.sameEachDay,
    required this.location,
    required this.ticketCost,
    required this.numberOfTickets,
    required this.photoURL,
  });

  // Factory constructor to create an Event instance from a Firebase snapshot
  factory Event.fromMap(Map<String, dynamic> data, String documentId) {
    return Event(
      id: documentId,
      title: data['title'],
      description: data['description'],
      startDate: (data['startDate'] as Timestamp).toDate(),
      endDate: (data['endDate'] as Timestamp).toDate(),
      timeMap: List<Map<String, TimeOfDay>>.from(data['timeMap']),
      category: data['category'],
      tags: List<String>.from(data['tags']),
      isRepeating: data['isRepeating'],
      repeatFrequency: data['repeatFrequency'],
      isMultiDayEvent: data['isMultiDayEvent'],
      sameEachDay: data['sameEachDay'],
      location: data['location'],
      ticketCost: data['ticketCost'],
      numberOfTickets: data['numberOfTickets'],
      photoURL: data['photoURL']
    );
  }

  // Method to convert Event instance to a map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
      'timeMap': timeMap,
      'category': category,
      'tags': tags,
      'isRepeating': isRepeating,
      'repeatFrequency': repeatFrequency,
      'isMultiDayEvent': isMultiDayEvent,
      'sameEachDay': sameEachDay,
      'location': location,
      'ticketCost': ticketCost,
      'numberOfTickets': numberOfTickets,
      'photoURL': photoURL
    };
  }

 


}

enum EventCategory {
  concert,
  conference,
  party,
  seminar,
  workshop,
  wedding,
  hackathon,
  technology,
  gathering,
  church,
  other,
}


List<String> eventCategoryList = EventCategory.values
    .map((category) => category.toString().split('.').last)
    .toList();

