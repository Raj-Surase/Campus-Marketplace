import 'package:campus_marketplace/screens/navigation/screens/dashboard/dashboard_product/dashboard_product_widget.dart';
import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/provider/product_provider.dart';
import 'package:campus_marketplace/utils/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardProductsScreen extends StatelessWidget {
  const DashboardProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final user = userProvider.user;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingSmallValue,
          vertical: AppSizes.paddingMediumValue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSizes.paddingSmallValue,
          children:
              user?.productIds.map((productId) {
                final product = productProvider.getProductById(productId);
                return product != null
                    ? DashboardProductWidget(product: product)
                    : SizedBox.shrink();
              }).toList() ??
              [],
        ),
      ),
    );
  }
}
