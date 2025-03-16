import 'package:campus_marketplace/screens/navigation/screens/home/widgets/product_container.dart';
import 'package:campus_marketplace/screens/navigation/screens/home/widgets/product_grid.dart';
import 'package:campus_marketplace/utils/model/product.dart';
import 'package:campus_marketplace/utils/provider/category_provider.dart';
import 'package:campus_marketplace/utils/widgets/category_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:campus_marketplace/utils/widgets/icon_text_tile.dart';
import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/constants/router.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<CategoryProvider>(context, listen: false).loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: AppSizes.paddingLargeValue,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingSmallValue),
            child: Center(
              child: SizedBox(
                width: AppSizes.screenWidth(context),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      AppSizes.borderRadiusMediumValue,
                    ),
                    child: Container(
                      color: AppColors.containerBackground(context),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: AppSizes.paddingLargeValue,
          ),
          categoryProvider.categories.isEmpty
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(width: AppSizes.paddingSmallValue,),
                      Row(
                        children: categoryProvider.categories.map((category) {
                          return CategoryButton(
                            title: category.name,
                            onTap: () {
                              print("Selected: ${category.name}");
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(width: AppSizes.paddingSmallValue,),
                    ],
                  ),
                ),

          SizedBox(
            height: AppSizes.paddingSmallValue,
          ),
          ProductGrid(),
          
          SizedBox(
            height: AppSizes.paddingLargeValue,
          ),
        ],
      ),
    );
  }
}
