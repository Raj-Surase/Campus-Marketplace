class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final int stock;
  final double rating;
  final DateTime createdAt;
  bool isLike = false; 

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.stock,
    required this.rating,
    required this.createdAt,
  });

  // Factory constructor to create a ProductModel from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image_url'],
      category: json['category'],
      stock: json['stock'] ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  bool get isLiked => isLike;

  set isLiked(bool isLiked) {
    isLike = isLiked;
  }

  // Method to convert a ProductModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image_url': imageUrl,
      'category': category,
      'stock': stock,
      'rating': rating,
      'created_at': createdAt.toIso8601String(),
    };
  }

  // ✅ Add a copyWith method to update fields safely
  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    String? category,
    int? stock,
    double? rating,
    DateTime? createdAt,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      stock: stock ?? this.stock,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
