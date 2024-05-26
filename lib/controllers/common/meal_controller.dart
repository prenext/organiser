import 'package:Organiser/models/common/meal_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MealController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _parentCollection;

  MealController(this._parentCollection);

  Future<void> addMeal(String documentId, Meal meal) async {
    try {
      await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('meals')
          .add(meal.toMap());
    } catch (e) {
      print('Error adding meal: $e');
      rethrow;
    }
  }

  Future<void> updateMeal(String documentId, Meal meal) async {
    try {
      await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('meals')
          .doc(meal.id)
          .set(meal.toMap());
    } catch (e) {
      print('Error updating meal: $e');
      rethrow;
    }
  }

  Future<void> deleteMeal(String documentId, String mealId) async {
    try {
      await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('meals')
          .doc(mealId)
          .delete();
    } catch (e) {
      print('Error deleting meal: $e');
      rethrow;
    }
  }

  Stream<List<Meal>> getAllMeals(String documentId) {
    return _firestore
        .collection(_parentCollection)
        .doc(documentId)
        .collection('meals')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Meal.fromMap(doc.data(), doc.id))
            .toList());
  }

  Future<Meal?> getMealById(String documentId, String mealId) async {
    try {
      var docSnapshot = await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('meals')
          .doc(mealId)
          .get();
      if (docSnapshot.exists) {
        return Meal.fromMap(docSnapshot.data() as Map<String, dynamic>, mealId);
      }
      return null;
    } catch (e) {
      print('Error fetching meal: $e');
      rethrow;
    }
  }
}
