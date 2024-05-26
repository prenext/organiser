import 'package:Organiser/models/enums/event_enums.dart';
import 'package:flutter/material.dart';

class Event {
  String id;
  String priority;
  String title;
  String notes;
  String category;
  List<String> tags;
  String photoURL;
  List<Map<DateTime, Map<TimeOfDay, TimeOfDay>>> dateAndTime;
  bool isRepeating;
  List<Map<RepeatFrequency, List>> repetition;
  List<Map<String, String>> location;
  double ticketCost;
  int numberOfTickets;
  String timezone;

  Event({
    required this.id,
    required this.title,
    required this.notes,
    required this.priority,
    required this.category,
    required this.tags,
    required this.photoURL,
    required this.dateAndTime,
    required this.isRepeating,
    required this.repetition,
    required this.location,
    required this.ticketCost,
    required this.numberOfTickets,
    required this.timezone,
  });

  factory Event.fromMap(Map<String, dynamic> data, String documentId) {
    return Event(
      id: documentId,
      title: data['title'],
      priority: data['priority'],
      notes: data['description'],
      category: data['category'],
      tags: List<String>.from(data['tags']),
      photoURL: data['photoURL'],
      dateAndTime: (data['dateAndTime'] as List<dynamic>).map((entry) {
        return (entry as Map<String, dynamic>).map((key, value) {
          return MapEntry(
            DateTime.parse(key),
            (value as Map<String, dynamic>).map((startTimeKey, startTimeValue) {
              return MapEntry(
                TimeOfDay.fromDateTime(DateTime.parse(startTimeKey)),
                TimeOfDay.fromDateTime(DateTime.parse(startTimeValue)),
              );
            }),
          );
        });
      }).toList(),
      isRepeating: data['isRepeating'],
      repetition: List<Map<RepeatFrequency, List>>.from(data['repetition']),
      location: List<Map<String, String>>.from(data['location']),
      ticketCost: data['ticketCost'],
      numberOfTickets: data['numberOfTickets'],
      timezone: data['timezone'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'priority': priority,
      'notes': notes,
      'category': category,
      'tags': tags,
      'photoURL': photoURL,
      'dateAndTime': dateAndTime.map((entry) {
        return entry.map((key, value) {
          return MapEntry(
            key.toIso8601String(),
            value.map((startTimeKey, startTimeValue) {
              return MapEntry(
                startTimeKey,
                startTimeValue,
              );
            }),
          );
        });
      }).toList(),
      'isRepeating': isRepeating,
      'repetition': repetition,
      'location': location,
      'ticketCost': ticketCost,
      'numberOfTickets': numberOfTickets,
      'timezone': timezone,
    };
  }
}
