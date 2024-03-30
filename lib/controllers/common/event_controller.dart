import 'package:Organiser/models/common/event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventsController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _parentCollection;

  EventsController(this._parentCollection);

  Future<void> addEvent(String documentId, Event event) async {
    try {
      await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('events')
          .add(event.toMap());
    } catch (e) {
      print('Error adding event: $e');
      rethrow;
    }
  }

  Future<void> updateEvent(String documentId, Event event) async {
    try {
      await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('events')
          .doc(event.id)
          .set(event.toMap());
    } catch (e) {
      print('Error updating event: $e');
      rethrow;
    }
  }

  Future<void> deleteEvent(String documentId, String eventId) async {
    try {
      await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('events')
          .doc(eventId)
          .delete();
    } catch (e) {
      print('Error deleting event: $e');
      rethrow;
    }
  }

  Stream<List<Event>> getAllEvents(String documentId) {
    return _firestore
        .collection(_parentCollection)
        .doc(documentId)
        .collection('events')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Event.fromMap(doc.data(), doc.id))
            .toList());
  }

  Future<Event?> getEventById(String documentId, String eventId) async {
    try {
      var docSnapshot = await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('events')
          .doc(eventId)
          .get();
      if (docSnapshot.exists) {
        return Event.fromMap(
            docSnapshot.data() as Map<String, dynamic>, eventId);
      }
      return null;
    } catch (e) {
      print('Error fetching event: $e');
      rethrow;
    }
  }
}
