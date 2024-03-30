class Market {
  String id;
  String name;
  String description;
  String type; 
  String imageUrl; 

  Market({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.imageUrl,
  });

  factory Market.fromJson(Map<String, dynamic> json) {
    return Market(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      type: json['type'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': type,
      'imageUrl': imageUrl,
    };
  }
}
