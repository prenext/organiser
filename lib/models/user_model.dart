import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String email;
  final String username;
  final String? fname;
  final String? lname;
  final String? gender;
  final DateTime? dob;
  final DateTime? createdAt;
  final String? profilePhotoUrl;
  final List<String> groupIds;
  final List<String> communityIds;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    this.fname,
    this.lname,
    this.gender,
    this.dob,
    this.createdAt,
    this.profilePhotoUrl,
    this.groupIds = const [],
    this.communityIds = const [],
  });

  static UserModel fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      email: data['email'],
      username: data['username'],
      fname: data['fname'],
      lname: data['lname'],
      gender: data['gender'],
      dob: DateTime.parse(data['dob']!),
      createdAt: DateTime.parse(data['createdAt']!),
      profilePhotoUrl: data['profilePhotoUrl'],
      groupIds: List<String>.from(data['groupIds'] ?? []),
      communityIds: List<String>.from(data['communityIds'] ?? []),
      
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'fname': fname,
      'lname': lname,
      'gender': gender,
      'dob': dob?.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),
      'profilePhotoUrl': profilePhotoUrl,
      'groupIds': groupIds,
      'communityIds': communityIds,
    };
  }
}
