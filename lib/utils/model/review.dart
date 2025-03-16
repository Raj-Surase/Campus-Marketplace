import 'dart:convert';

class ReviewModel {
  final String id;
  final String productId;
  final String userName;
  final String userEmail;
  final String? userPhoto;
  final int rating;
  final String comment;
  final DateTime createdAt;

  ReviewModel({
    required this.id,
    required this.productId,
    required this.userName,
    required this.userEmail,
    this.userPhoto,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  // Factory constructor to create a ReviewModel from JSON
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      productId: json['product_id'],
      userName: json['user_name'],
      userEmail: json['user_email'],
      userPhoto: json['user_photo'],
      rating: json['rating'],
      comment: json['comment'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  // Convert ReviewModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'user_name': userName,
      'user_email': userEmail,
      'user_photo': userPhoto,
      'rating': rating,
      'comment': comment,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
