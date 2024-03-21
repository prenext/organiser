import 'dart:async';
import 'package:flutter/material.dart';
import 'package:Organiser/controllers/user_controller.dart';
import 'package:Organiser/models/user.dart';

class UserProvider with ChangeNotifier {
  final UserController _userController = UserController();
  UserModel? _user;

  UserModel? get user => _user;

  // Stream controller for emitting user data updates
  final StreamController<UserModel?> _userStreamController =
      StreamController<UserModel?>.broadcast();

  // Stream getter for user data
  Stream<UserModel?> get userStream => _userStreamController.stream;

  // Create a new user using the user controller
  Future<void> createUser(UserModel user) async {
    await _userController.createUser(user);
    _user = user;
    _userStreamController.add(_user); // Emit user data update
    notifyListeners();
  }

  // Get a user using the user controller
  Future<void> getUser({required String userId}) async {
    final user = await _userController.getUser(userId);
    _user = user;
    _userStreamController.add(_user); // Emit user data update
    notifyListeners();
  }

  Future<void> updateUser(String userId, Map<String, dynamic> updates) async {
    await _userController.updateUser(userId, updates);
    _user = await _userController.getUser(userId);
    _userStreamController.add(_user); // Emit user data update
    notifyListeners();
  }

  Future<void> deleteUser(String userId) async {
    await _userController.deleteUser(userId);
    _user = null;
    _userStreamController.add(_user); // Emit user data update
    notifyListeners();
  }

  // Dispose the stream controller when no longer needed
  @override
  void dispose() {
    _userStreamController.close();
    super.dispose();
  }
}
