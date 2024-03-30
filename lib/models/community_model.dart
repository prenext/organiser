import 'package:cloud_firestore/cloud_firestore.dart';

class Community {
  String id;
  String name;
  String description;
  String creatorId; 
  String imageUrl;
  Timestamp createdAt;

  Community({
    required this.id,
    required this.name,
    required this.description,
    required this.creatorId,
    required this.imageUrl,
    required this.createdAt,
  });

  factory Community.fromMap(Map<String, dynamic> data, String documentId) {
    return Community(
      id: documentId,
      name: data['name'],
      description: data['description'],
      creatorId: data['creatorId'],
      imageUrl: data['imageUrl'],
      createdAt: data['createdAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'creatorId': creatorId,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
    };
  }
}
