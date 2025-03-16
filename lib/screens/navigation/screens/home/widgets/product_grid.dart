
import 'dart:convert';

import 'package:campus_marketplace/screens/navigation/screens/home/widgets/product_container.dart';
import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductGrid extends StatefulWidget {
  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final String response = await rootBundle.loadString('assets/data/product.json');
    final List<dynamic> jsonData = json.decode(response);
    setState(() {
      products = jsonData.map((item) => ProductModel.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingSmallValue),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.55,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductContainer(product: products[index]);
        },
      ),
    );
  }
}

