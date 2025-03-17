class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String categoryId;
  final int stock;
  final double rating;
  final DateTime createdAt;
  bool isLike = false;
  final List<String> reviewIds;
  final bool isAvailable; // New field

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
    required this.stock,
    required this.rating,
    required this.createdAt,
    required this.reviewIds,
    required this.isAvailable, // Initialize new field
  });

  // Factory constructor to create a ProductModel from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image_url'],
      categoryId: json['category_id'],
      stock: json['stock'] ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      createdAt: DateTime.parse(json['created_at']),
      reviewIds: List<String>.from(json['review_ids'] ?? []),
      isAvailable: json['is_available'] ?? true, // Default to true if not provided
    );
  }

  bool get isLiked => isLike;

  set isLiked(bool isLiked) {
    isLike = isLiked;
  }

  // Convert ProductModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image_url': imageUrl,
      'category_id': categoryId,
      'stock': stock,
      'rating': rating,
      'created_at': createdAt.toIso8601String(),
      'review_ids': reviewIds,
      'is_available': isAvailable, // Include new field
    };
  }

  // ✅ Add a copyWith method to update fields safely
  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    String? categoryId,
    int? stock,
    double? rating,
    DateTime? createdAt,
    List<String>? reviewIds,
    bool? isAvailable, // New field in copyWith
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      categoryId: categoryId ?? this.categoryId,
      stock: stock ?? this.stock,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
      reviewIds: reviewIds ?? this.reviewIds,
      isAvailable: isAvailable ?? this.isAvailable, // Ensure new field is updated properly
    );
  }
}
