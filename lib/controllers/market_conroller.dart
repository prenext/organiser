import 'package:Organiser/models/market_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MarketController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Market>> getAllMarkets() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('markets').get();
      return querySnapshot.docs.map((doc) {
        return Market.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print('Error getting all markets: $e');
      rethrow;
    }
  }

  Future<void> addMarket(Market market) async {
    try {
      await _firestore
          .collection('markets')
          .doc(market.id)
          .set(market.toJson());
    } catch (e) {
      print('Error adding market: $e');
      rethrow;
    }
  }

  Future<Market?> getMarket(String marketId) async {
    try {
      var docSnapshot =
          await _firestore.collection('markets').doc(marketId).get();
      if (docSnapshot.exists) {
        return Market.fromJson(docSnapshot.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print('Error getting market: $e');
      rethrow;
    }
  }

  Future<void> updateMarket(Market market) async {
    try {
      await _firestore
          .collection('markets')
          .doc(market.id)
          .update(market.toJson());
    } catch (e) {
      print('Error updating market: $e');
      rethrow;
    }
  }

  Future<void> deleteMarket(String marketId) async {
    try {
      await _firestore.collection('markets').doc(marketId).delete();
    } catch (e) {
      print('Error deleting market: $e');
      rethrow;
    }
  }
}
