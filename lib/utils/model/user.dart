class UserModel {
  final String name;
  final String email;
  final String? profileUrl; // Optional
  final DateTime createdAt;
  final String? firebaseUid; // Firebase Authentication UID
  final int coins; // User reward coins
  final List<String> favoriteIds; // New field for favorite product IDs
  final List<String> productIds; // List of favorite product IDs

  UserModel({
    required this.name,
    required this.email,
    this.profileUrl,
    required this.createdAt,
    this.firebaseUid,
    this.coins = 0, // Default to 0
    required this.productIds,
    required this.favoriteIds,
  });

  /// ✅ **Factory constructor to create a `UserModel` from JSON**
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      profileUrl: json['profile_url'],
      createdAt: DateTime.parse(json['created_at']),
      firebaseUid: json['firebase_uid'],
      coins: json['coins'] ?? 0, // Default value for coins
      productIds:
          json['product_ids'] != null
              ? List<String>.from(json['product_ids'])
              : [], // Ensure `productIds` is an empty list if null
      favoriteIds: List<String>.from(
        json['favorite_ids'] ?? [],
      ), // Default to empty list if null
    );
  }

  /// ✅ **Convert a `UserModel` instance to JSON**
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'profile_url': profileUrl,
      'created_at': createdAt.toIso8601String(),
      'firebase_uid': firebaseUid,
      'coins': coins,
      'product_ids': productIds, // Store as array
      'favorite_ids': favoriteIds, // Store as array
    };
  }

  /// ✅ **`copyWith` method to create a new instance with modified fields**
  UserModel copyWith({
    String? name,
    String? email,
    String? profileUrl,
    DateTime? createdAt,
    String? firebaseUid,
    int? coins,
    List<String>? productIds,
    List<String>? favoriteIds,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      profileUrl: profileUrl ?? this.profileUrl,
      createdAt: createdAt ?? this.createdAt,
      firebaseUid: firebaseUid ?? this.firebaseUid,
      coins: coins ?? this.coins,
      productIds:
          productIds ?? List.from(this.productIds), // Ensure immutability
      favoriteIds:
          favoriteIds ??
          this.favoriteIds, // Ensure new field is updated properly
    );
  }
}
