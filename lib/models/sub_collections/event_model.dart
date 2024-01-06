import 'package:flutter/material.dart';
import 'package:Organiser/models/sub_collections/event.dart';

class EventModel extends ChangeNotifier {
  List<Event> events = [];

  void addEvent(Event newEvent) {
    events.add(newEvent);
    notifyListeners();
  }

  void updateEvent(Event updatedEvent) {
    final index = events.indexWhere((event) => event.id == updatedEvent.id);
    if (index != -1) {
      events[index] = updatedEvent;
      notifyListeners();
    }
  }

  void deleteEvent(String eventId) {
    events.removeWhere((event) => event.id == eventId);
    notifyListeners();
  }

  Event? getEventById(String eventId) {
    return events.firstWhere((event) => event.id == eventId);
  }
  
}
