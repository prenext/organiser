import 'package:Organiser/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UserController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _firestore.collection('users').doc(user.id).set(user.toMap());
  }

  Future<UserModel?> getUser(String userId) async {
    final docSnapshot = await _firestore.collection('users').doc(userId).get();
    if (docSnapshot.exists) {
      return UserModel.fromDocument(docSnapshot);
    } else {
      return null;
    }
  }

  Future<void> updateUser(String userId, Map<String, dynamic> updates) async {
    await _firestore.collection('users').doc(userId).update(updates);
  }

  Future<void> deleteUser(String userId) async {
    await _firestore.collection('users').doc(userId).delete();
  }
}
