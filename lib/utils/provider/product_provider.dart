import 'dart:convert';
import 'package:campus_marketplace/utils/model/product.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  bool _isLoading = false;

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;

  /// Load products from `assets/product.json`
  Future<void> loadProducts() async {
    try {
      _isLoading = true;
      notifyListeners();

      final String response = await rootBundle.loadString('assets/data/product.json');
      final List<dynamic> data = jsonDecode(response);

      _products = data.map((json) => ProductModel.fromJson(json)).toList();

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      print("Error loading products: $error");
    }
  }
}
