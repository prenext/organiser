import 'package:Organiser/models/common/schedule_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScheduleController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _parentCollection;

  ScheduleController(this._parentCollection);

  Future<void> addSchedule(String documentId, Schedule schedule) async {
    try {
      await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('schedules')
          .add(schedule.toMap());
    } catch (e) {
      print('Error adding schedule: $e');
      rethrow;
    }
  }

  Future<void> updateSchedule(String documentId, Schedule schedule) async {
    try {
      await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('schedules')
          .doc(schedule.id)
          .set(schedule.toMap());
    } catch (e) {
      print('Error updating schedule: $e');
      rethrow;
    }
  }

  Future<void> deleteSchedule(String documentId, String scheduleId) async {
    try {
      await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('schedules')
          .doc(scheduleId)
          .delete();
    } catch (e) {
      print('Error deleting schedule: $e');
      rethrow;
    }
  }

  Stream<List<Schedule>> getAllSchedules(String documentId) {
    return _firestore
        .collection(_parentCollection)
        .doc(documentId)
        .collection('schedules')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Schedule.fromMap(doc.data(), doc.id))
            .toList());
  }

  Future<Schedule?> getScheduleById(
      String documentId, String scheduleId) async {
    try {
      var docSnapshot = await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('schedules')
          .doc(scheduleId)
          .get();
      if (docSnapshot.exists) {
        return Schedule.fromMap(
            docSnapshot.data() as Map<String, dynamic>, scheduleId);
      }
      return null;
    } catch (e) {
      print('Error fetching schedule: $e');
      rethrow;
    }
  }
}
