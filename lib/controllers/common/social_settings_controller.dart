import 'package:Organiser/models/common/social_settings_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SocialSettingsController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _parentCollection;

  SocialSettingsController(this._parentCollection);

  Future<void> updateMemberSettings(
      String documentId, String memberId, SocialSettings settings) async {
    try {
      await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('members')
          .doc(memberId)
          .collection('settings')
          .doc('social')
          .set(settings.toJson());
    } catch (e) {
      print('Error updating member settings: $e');
      rethrow;
    }
  }

  Future<SocialSettings?> getMemberSettings(
      String documentId, String memberId) async {
    try {
      var docSnapshot = await _firestore
          .collection(_parentCollection)
          .doc(documentId)
          .collection('members')
          .doc(memberId)
          .collection('settings')
          .doc('social')
          .get();
      if (docSnapshot.exists) {
        return SocialSettings.fromJson(docSnapshot.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print('Error fetching member settings: $e');
      rethrow;
    }
  }
}
