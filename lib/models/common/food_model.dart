class Food {
  String id;
  String name;
  String type;
  double price;
  String content;
  List<String> ingredients;

  Food({
    required this.id,
    required this.name,
    required this.type,
    required this.price,
    required this.content,
    required this.ingredients,
    
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      price: json['price'].toDouble(),
      content: json['content'],
      ingredients: List<String>.from(json['ingredients']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'price': price,
      'content': content,
      'ingredients': ingredients,
    };
  }
}
