import 'package:cloud_firestore/cloud_firestore.dart';

class Group {
  String id;
  String name;
  String description;
  String creatorId; 
  List<String> members; 
  String imageUrl; 
  Timestamp createdAt;

  Group({
    required this.id,
    required this.name,
    required this.description,
    required this.creatorId,
    required this.members,
    required this.imageUrl,
    required this.createdAt,
  });

  factory Group.fromMap(Map<String, dynamic> data, String documentId) {
    return Group(
      id: documentId,
      name: data['name'],
      description: data['description'],
      creatorId: data['creatorId'],
      members: List<String>.from(data['members']),
      imageUrl: data['imageUrl'],
      createdAt: data['createdAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'creatorId': creatorId,
      'members': members,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
    };
  }
}
