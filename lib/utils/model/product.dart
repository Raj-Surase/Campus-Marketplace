class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String categoryId;
  final String userId;
  final int stock;
  final double rating;
  final DateTime createdAt;
  bool isLike = false;
  final List<String> reviewIds;
  final bool isAvailable;
  final int quantity; // Added field
  final String sellingOption; // Added field

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
    required this.userId,
    required this.stock,
    required this.rating,
    required this.createdAt,
    required this.reviewIds,
    required this.isAvailable,
    required this.quantity, // Initialize new field
    required this.sellingOption, // Initialize new field
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image_url'],
      categoryId: json['category_id'],
      userId: json['user_id'],
      stock: json['stock'] ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      createdAt: DateTime.parse(json['created_at']),
      reviewIds: List<String>.from(json['review_ids'] ?? []),
      isAvailable: json['is_available'] ?? true,
      quantity: json['quantity'] ?? 0, // Parse quantity
      sellingOption: json['selling_option'] ?? 'Rent', // Default to 'Rent'
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image_url': imageUrl,
      'category_id': categoryId,
      'user_id': userId,
      'stock': stock,
      'rating': rating,
      'created_at': createdAt.toIso8601String(),
      'review_ids': reviewIds,
      'is_available': isAvailable,
      'quantity': quantity, // Include quantity
      'selling_option': sellingOption, // Include selling option
    };
  }

  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    String? categoryId,
    String? userId,
    int? stock,
    double? rating,
    DateTime? createdAt,
    List<String>? reviewIds,
    bool? isAvailable,
    int? quantity, // New field in copyWith
    String? sellingOption, // New field in copyWith
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      categoryId: categoryId ?? this.categoryId,
      userId: userId ?? this.userId,
      stock: stock ?? this.stock,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
      reviewIds: reviewIds ?? this.reviewIds,
      isAvailable: isAvailable ?? this.isAvailable,
      quantity: quantity ?? this.quantity, // Ensure quantity is updated
      sellingOption:
          sellingOption ??
          this.sellingOption, // Ensure selling option is updated
    );
  }
}
