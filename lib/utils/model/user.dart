class UserModel {
  final String name;
  final String email;
  final String? profileUrl; // Optional
  final DateTime createdAt;
  final String? firebaseUid; // New column

  UserModel({
    required this.name,
    required this.email,
    this.profileUrl,
    required this.createdAt,
    this.firebaseUid,
  });

  // Factory constructor to create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      profileUrl: json['profile_url'],
      createdAt: DateTime.parse(json['created_at']),
      firebaseUid: json['firebase_uid'],
    );
  }

  // Method to convert a UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'profile_url': profileUrl,
      'created_at': createdAt.toIso8601String(),
      'firebase_uid': firebaseUid,
    };
  }

  // ✅ Add a copyWith method to update fields safely
  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? profileUrl,
    int? coins,
    DateTime? createdAt,
    String? firebaseUid,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      profileUrl: profileUrl ?? this.profileUrl,
      createdAt: createdAt ?? this.createdAt,
      firebaseUid: firebaseUid ?? this.firebaseUid,
    );
  }
}
