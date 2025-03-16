import 'package:campus_marketplace/screens/navigation/screens/home/widgets/product_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:campus_marketplace/screens/navigation/screens/home/widgets/product_container.dart';
import 'package:campus_marketplace/utils/constants/app_sizes.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productViewModel = Provider.of<ProductViewModel>(context);

    return FutureBuilder(
      future: productViewModel.loadProducts(),
      builder: (context, snapshot) {
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return Center(child: CircularProgressIndicator());
        // }

        if (productViewModel.products.isEmpty) {
          return Center(child: Text("No products available"));
        }

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
            itemCount: productViewModel.products.length,
            itemBuilder: (context, index) {
              return ProductContainer(product: productViewModel.products[index]);
            },
          ),
        );
      },
    );
  }
}