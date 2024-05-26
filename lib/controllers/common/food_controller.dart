import 'package:Organiser/models/common/food_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Food?> getFood(String marketId, String foodId) async {
    try {
      var docSnapshot = await _firestore
          .collection('markets')
          .doc(marketId)
          .collection('foods')
          .doc(foodId)
          .get();
      if (docSnapshot.exists) {
        return Food.fromJson(docSnapshot.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print('Error getting food: $e');
      rethrow;
    }
  }

  Future<List<Food>> getAllFoods(String marketId) async {
    try {
      var querySnapshot = await _firestore
          .collection('markets')
          .doc(marketId)
          .collection('foods')
          .get();
      return querySnapshot.docs
          .map((doc) => Food.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error getting all foods: $e');
      rethrow;
    }
  }

  Stream<List<Food>> listenToFoods(String marketId) {
    try {
      return _firestore
          .collection('markets')
          .doc(marketId)
          .collection('foods')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => Food.fromJson(doc.data()))
              .toList());
    } catch (e) {
      print('Error listening to foods: $e');
      rethrow;
    }
  }

  Future<void> addFood(String marketId, Food food) async {
    try {
      await _firestore
          .collection('markets')
          .doc(marketId)
          .collection('foods')
          .doc(food.id)
          .set(food.toJson());
    } catch (e) {
      print('Error adding food: $e');
      rethrow;
    }
  }

  Future<void> updateFood(String marketId, Food food) async {
    try {
      await _firestore
          .collection('markets')
          .doc(marketId)
          .collection('foods')
          .doc(food.id)
          .update(food.toJson());
    } catch (e) {
      print('Error updating food: $e');
      rethrow;
    }
  }

  Future<void> deleteFood(String marketId, String foodId) async {
    try {
      await _firestore
          .collection('markets')
          .doc(marketId)
          .collection('foods')
          .doc(foodId)
          .delete();
    } catch (e) {
      print('Error deleting food: $e');
      rethrow;
    }
  }
}
