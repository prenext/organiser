import 'package:Organiser/models/common/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _parentCollection;

  TaskController(this._parentCollection);

  Future<void> addTask(String documentId, Task task) async {
    try {
      await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('tasks')
          .add(task.toMap());
    } catch (e) {
      print('Error adding task: $e');
      rethrow;
    }
  }

  Future<void> updateTask(String documentId, Task task) async {
    try {
      await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('tasks')
          .doc(task.id)
          .set(task.toMap());
    } catch (e) {
      print('Error updating task: $e');
      rethrow; 
    }
  }

  Future<void> deleteTask(String documentId, String taskId) async {
    try {
      await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('tasks')
          .doc(taskId)
          .delete();
    } catch (e) {
      print('Error deleting task: $e');
      rethrow;
    }
  }

  Stream<List<Task>> getAllTasks(String documentId) {
    return _firestore
        .collection(_parentCollection)
        .doc(documentId)
        .collection('tasks')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Task.fromMap(doc.data(), doc.id))
            .toList());
  }

  Future<Task?> getTaskById(String documentId, String taskId) async {
    try {
      var docSnapshot = await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('tasks')
          .doc(taskId)
          .get();
      if (docSnapshot.exists) {
        return Task.fromMap(docSnapshot.data() as Map<String, dynamic>, taskId);
      }
      return null;
    } catch (e) {
      print('Error fetching task: $e');
      rethrow;
    }
  }
}
