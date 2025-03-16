import 'dart:convert';
import 'package:campus_marketplace/utils/model/review.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class ReviewProvider with ChangeNotifier {
  List<ReviewModel> _reviews = [];
  bool _isLoading = false;

  List<ReviewModel> get reviews => _reviews;
  bool get isLoading => _isLoading;

  /// Load reviews from `assets/reviews.json`
  Future<void> loadReviews() async {
    try {
      _isLoading = true;
      notifyListeners();

      final String response = await rootBundle.loadString('assets/data/review.json');
      final List<dynamic> data = jsonDecode(response);

      _reviews = data.map((json) => ReviewModel.fromJson(json)).toList();

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      print("Error loading reviews: $error");
    }
  }

  /// Get reviews for a specific product
  List<ReviewModel> getReviewsByProductId(String productId) {
    return _reviews.where((review) => review.productId == productId).toList();
  }
}
