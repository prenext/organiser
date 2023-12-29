import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String email;
  final String username;
  final String fname;
  final String lname;
  final String? gender;
  final DateTime? dob;
  final String? profilePhotoUrl;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.fname,
    required this.lname,
    this.gender,
    this.dob,
    this.profilePhotoUrl,
  });

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
    );
  }
}

//TODO: define users  sub collections such as goals tasks events meals and schedules