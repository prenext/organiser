import 'package:Organiser/models/common/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String parentCollection;
  final String ownerId;

  TaskController(this.parentCollection, this.ownerId);

  Future<void> addTask(Task task) async {
    try {
      await _firestore
          .collection(parentCollection)
          .doc(ownerId)
          .collection('tasks')
          .add(task.toMap());
    } catch (e) {
      print('Error adding task: $e');
      rethrow;
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await _firestore
          .collection(parentCollection)
          .doc(ownerId)
          .collection('tasks')
          .doc(task.id)
          .set(task.toMap());
    } catch (e) {
      print('Error updating task: $e');
      rethrow;
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await _firestore
          .collection(parentCollection)
          .doc(ownerId)
          .collection('tasks')
          .doc(taskId)
          .delete();
    } catch (e) {
      print('Error deleting task: $e');
      rethrow;
    }
  }

  Future<List<Task>> getAllTasks() async {
    try {
      var querySnapshot = await _firestore
          .collection(parentCollection)
          .doc(ownerId)
          .collection('tasks')
          .get();

      return querySnapshot.docs
          .map((doc) => Task.fromMap(doc.data(), doc.id))
          .toList();
    } catch (e) {
      print('Error fetching tasks: $e');
      rethrow;
    }
  }

  Future<Task?> getTaskById(String taskId) async {
    try {
      var docSnapshot = await _firestore
          .collection(parentCollection)
          .doc(ownerId)
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
