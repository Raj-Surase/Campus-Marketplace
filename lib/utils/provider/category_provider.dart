import 'dart:convert';
import 'package:campus_marketplace/utils/model/category.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> _categories = [];

  List<CategoryModel> get categories => _categories;

  /// Load categories from JSON file
  Future<void> loadCategories() async {
    try {
      final String response = await rootBundle.loadString('assets/data/category.json');
      final List<dynamic> data = json.decode(response);
      _categories = data.map((json) => CategoryModel.fromJson(json)).toList();
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print("Error loading categories: $e");
      }
    }
  }

  /// Fetch category name based on `categoryId`
  String? getCategoryName(String categoryId) {
    return _categories.firstWhere(
      (category) => category.id == categoryId,
      orElse: () => CategoryModel(id: "", name: "Unknown"), // Default fallback
    ).name;
  }
}

