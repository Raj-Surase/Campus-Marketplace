import 'dart:convert';
import 'package:campus_marketplace/utils/model/product.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class ProductViewModel extends ChangeNotifier {
  List<ProductModel> _allProducts = [];
  List<ProductModel> _filteredProducts = [];
  String? _selectedCategoryId; // Track the selected category

  List<ProductModel> get products => _filteredProducts;
  String? get selectedCategoryId => _selectedCategoryId;

  /// Load products from JSON and filter based on the selected category
  Future<void> loadProducts() async {
    final String response = await rootBundle.loadString('assets/data/product.json');
    final List<dynamic> jsonData = json.decode(response);

    _allProducts = jsonData.map((item) => ProductModel.fromJson(item)).toList();

    filterProducts(); // Apply filtering after loading products
  }

  /// Change selected category and re-filter products
  void changeSelectedCategory(String? categoryId) {
    _selectedCategoryId = categoryId;
    filterProducts();
  }

  /// Filter products based on the selected category
  void filterProducts() {
    if (_selectedCategoryId == null) {
      _filteredProducts = _allProducts;
    } else {
      _filteredProducts = _allProducts.where((product) => product.categoryId == _selectedCategoryId).toList();
    }

    notifyListeners(); // Notify UI of changes
  }
}
