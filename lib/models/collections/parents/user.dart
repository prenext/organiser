import 'package:cloud_firestore/cloud_firestore.dart';

// Define an enum for subcollections
enum SubCollection {
  goals,
  tasks,
  events,
  meals,
  schedules,
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
  final Map<SubCollection, List<dynamic>> subcollections;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.fname,
    required this.lname,
    this.gender,
    this.dob,
    this.profilePhotoUrl,
    Map<SubCollection, List<dynamic>>? subcollections,
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
      'subcollections':
          subcollections.map((key, value) => MapEntry(key.toString(), value)),
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
      subcollections: Map<SubCollection, List<dynamic>>.fromEntries(
        SubCollection.values.map((subcollection) {
          final key = subcollection;
          final value =
              List<dynamic>.from(map['subcollections'][key.toString()] ?? []);
          return MapEntry(key, value);
        }),
      ),
    );
  }
}
