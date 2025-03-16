class CategoryModel {
  final String id;
  final String name;
  final List<String> productIds;

  CategoryModel({
    required this.id,
    required this.name,
    required this.productIds,
  });

  // Factory method to create a CategoryModel from JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      productIds: List<String>.from(json['productIds'] ?? []),
    );
  }

  // Convert CategoryModel object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'productIds': productIds,
    };
  }
}
