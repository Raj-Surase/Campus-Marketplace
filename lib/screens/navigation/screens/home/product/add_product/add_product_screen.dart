import 'dart:io';

import 'package:campus_marketplace/screens/navigation/screens/home/product/add_product/widgets/reusable_image_picker.dart';
import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/model/category.dart';
import 'package:campus_marketplace/utils/model/product.dart';
import 'package:campus_marketplace/utils/provider/category_provider.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';
import 'package:campus_marketplace/utils/widgets/custom_dropdown.dart';
import 'package:campus_marketplace/utils/widgets/reusable_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  final ProductModel? product;
  const AddProductScreen({super.key, this.product});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late TextEditingController productNameController;
  late TextEditingController productPriceController;
  late TextEditingController productQuantityController;

  String? selectedOption;
  String? selectedCategory;
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    final categoryProvider = Provider.of<CategoryProvider>(
      context,
      listen: false,
    );
    categoryProvider.loadCategories();

    // Initialize controllers and values
    productNameController = TextEditingController(
      text: widget.product?.name ?? '',
    );
    productPriceController = TextEditingController(
      text: widget.product?.price.toString() ?? '',
    );
    productQuantityController = TextEditingController(
      text: widget.product?.quantity?.toString() ?? '',
    );
    selectedOption =
        widget.product?.sellingOption ?? 'Rent'; // Default selection

    // Fetch category name using category ID
    final categoryId = widget.product?.categoryId;
    selectedCategory =
        categoryProvider.categories
            .firstWhere(
              (cat) => cat.id == categoryId,
              orElse: () => CategoryModel(id: '', name: ''),
            )
            .name;
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    List<String> categoryNames =
        categoryProvider.categories.map((cat) => cat.name).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product == null ? "Add Product" : "Edit Product",
          style: AppTextStyles.largeSubHeading(context),
        ),
        titleSpacing: 0,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.paddingSmallValue,
            vertical: AppSizes.paddingSmallValue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Product Name", style: AppTextStyles.subHeading(context)),
              SizedBox(height: AppSizes.paddingSmallValue),
              ReusableTextField(
                labelText: "Enter product name",
                controller: productNameController,
              ),
              SizedBox(height: AppSizes.paddingMediumValue),

              Text("Quantity", style: AppTextStyles.subHeading(context)),
              SizedBox(height: AppSizes.paddingSmallValue),
              ReusableTextField(
                labelText: "Enter quantity",
                controller: productQuantityController,
              ),
              SizedBox(height: AppSizes.paddingMediumValue),

              Text("Category", style: AppTextStyles.subHeading(context)),
              SizedBox(height: AppSizes.paddingSmallValue),
              ReusableDropdown(
                selectedValue: selectedCategory,
                items: categoryNames,
                valueMap: {for (var name in categoryNames) name: name},
                labelText: 'Select Category',
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue;
                  });
                },
              ),
              SizedBox(height: AppSizes.paddingMediumValue),

              Text("Selling Option", style: AppTextStyles.subHeading(context)),
              SizedBox(height: AppSizes.paddingSmallValue),
              ReusableDropdown(
                selectedValue: selectedOption,
                items: ['Rent', 'Sell'],
                valueMap: {'Rent': 'rent', 'Sell': 'sell'},
                labelText: 'Select Option',
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOption = newValue;
                  });
                },
              ),
              SizedBox(height: AppSizes.paddingMediumValue),

              Text(
                selectedOption == 'Rent' ? "Charges (per day)" : "Price",
                style: AppTextStyles.subHeading(context),
              ),
              SizedBox(height: AppSizes.paddingSmallValue),
              ReusableTextField(
                labelText: "Enter amount",
                controller: productPriceController,
              ),
              SizedBox(height: AppSizes.paddingMediumValue),

              Text("Upload image", style: AppTextStyles.subHeading(context)),
              SizedBox(height: AppSizes.paddingSmallValue),
              ReusableImagePicker(
                onImageSelected: (File? image) {
                  setState(() {
                    _selectedImage = image;
                  });
                },
              ),
              SizedBox(height: AppSizes.paddingMediumValue),

              ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppSizes.borderRadiusMediumValue,
                ),
                child: Container(
                  color: AppColors.blueAccent(context),
                  child: GestureDetector(
                    onTap:
                        _selectedImage == null
                            ? null
                            : () {
                              print(
                                "Image ready for upload: \${_selectedImage!.path}",
                              );
                            },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.paddingMediumValue,
                        vertical: AppSizes.paddingSmallValue,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Upload",
                            style: AppTextStyles.subHeading(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSizes.paddingLargeValue),
            ],
          ),
        ),
      ),
    );
  }
}
