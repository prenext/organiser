import 'package:Organiser/controllers/user_controller.dart';
import 'package:Organiser/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  final UserController _userController = UserController();
  UserModel? _user;

  UserModel? get user => _user;

  Future<void> createUser(UserModel user) async {
    await _userController.createUser(user);
    _user = user;
    notifyListeners();
  }

  Future<void> getUser(String userId) async {
    final user = await _userController.getUser(userId);
    _user = user;
    notifyListeners();
  }

  Future<void> updateUser(String userId, Map<String, dynamic> updates) async {
    await _userController.updateUser(userId, updates);
    _user = await _userController.getUser(userId);
    notifyListeners();
  }

  Future<void> deleteUser(String userId) async {
    await _userController.deleteUser(userId);
    _user = null;
    notifyListeners();
  }
}
