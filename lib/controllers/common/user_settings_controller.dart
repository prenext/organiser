import 'package:Organiser/models/common/user_settings_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserSettingsController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _parentCollection;

  UserSettingsController(this._parentCollection);

  Future<void> updateSettings(String documentId, UserSettings settings) async {
    try {
      await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .set(settings.toMap());
    } catch (e) {
      print('Error updating settings: $e');
      rethrow; // Rethrow the error for handling in the UI
    }
  }

  Future<UserSettings?> getSettings(String documentId) async {
    try {
      var docSnapshot =
          await _firestore.collection(_parentCollection).doc(documentId).get();
      if (docSnapshot.exists) {
        return UserSettings.fromMap(docSnapshot.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print('Error fetching settings: $e');
      rethrow; // Rethrow the error for handling in the UI
    }
  }
}
