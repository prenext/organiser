import 'package:cloud_firestore/cloud_firestore.dart';

// Define a class to represent subcollections
class SubCollection {
  static const goals = 'goals';
  static const tasks = 'tasks';
  static const events = 'events';
  static const meals = 'meals';
  static const schedules = 'schedules';
}

class UserModel {
  final String id;
  final String email;
  final String username;
  final String fname;
  final String lname;
  final String? gender;
  final DateTime? dob;
  final String? profilePhotoUrl;
  final Map<String, List<dynamic>> subcollections;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.fname,
    required this.lname,
    this.gender,
    this.dob,
    this.profilePhotoUrl,
    Map<String, List<dynamic>>? subcollections,
  }) : subcollections = subcollections ?? {};

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'fname': fname,
      'lname': lname,
      'gender': gender,
      'dob': dob,
      'profilePhotoUrl': profilePhotoUrl,
      'subcollections': subcollections,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      username: map['username'],
      fname: map['fname'],
      lname: map['lname'],
      gender: map['gender'],
      dob: map['dob'] != null ? (map['dob'] as Timestamp).toDate() : null,
      profilePhotoUrl: map['profilePhotoUrl'],
      subcollections:
          Map<String, List<dynamic>>.from(map['subcollections'] ?? {}),
    );
  }
}
