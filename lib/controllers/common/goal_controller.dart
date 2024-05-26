import 'package:Organiser/models/common/goal_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GoalController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _parentCollection;

  GoalController(this._parentCollection);

  Future<void> addGoal(String documentId, Goal goal) async {
    try {
      await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('goals')
          .add(goal.toMap());
    } catch (e) {
      print('Error adding goal: $e');
      rethrow;
    }
  }

  Future<void> updateGoal(String documentId, Goal goal) async {
    try {
      await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('goals')
          .doc(goal.id)
          .set(goal.toMap());
    } catch (e) {
      print('Error updating goal: $e');
      rethrow;
    }
  }

  Future<void> deleteGoal(String documentId, String goalId) async {
    try {
      await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('goals')
          .doc(goalId)
          .delete();
    } catch (e) {
      print('Error deleting goal: $e');
      rethrow;
    }
  }

  Stream<List<Goal>> getAllGoals(String documentId) {
    return _firestore
        .collection(_parentCollection)
        .doc(documentId)
        .collection('goals')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Goal.fromMap(doc.data(), doc.id))
            .toList());
  }

  Future<Goal?> getGoalById(String documentId, String goalId) async {
    try {
      var docSnapshot = await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('goals')
          .doc(goalId)
          .get();
      if (docSnapshot.exists) {
        return Goal.fromMap(docSnapshot.data() as Map<String, dynamic>, goalId);
      }
      return null;
    } catch (e) {
      print('Error fetching goal: $e');
      rethrow;
    }
  }
}
