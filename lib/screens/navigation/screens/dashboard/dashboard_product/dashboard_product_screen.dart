
import 'package:campus_marketplace/screens/navigation/screens/dashboard/dashboard_product/dashboard_product_widget.dart';
import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class DashboardProductsScreen extends StatelessWidget {
  const DashboardProductsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.paddingSmallValue,
        vertical: AppSizes.paddingMediumValue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DashboardProductWidget(),
        ],
      ),
    );
  }
}