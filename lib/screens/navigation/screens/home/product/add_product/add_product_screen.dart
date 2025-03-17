import 'dart:io';

import 'package:campus_marketplace/screens/navigation/screens/home/product/add_product/widgets/reusable_image_picker.dart';
import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/provider/category_provider.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';
import 'package:campus_marketplace/utils/widgets/custom_dropdown.dart';
import 'package:campus_marketplace/utils/widgets/reusable_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();

  String? selectedOption = 'Rent'; // Default selection
  String? selectedCategory;

  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    Provider.of<CategoryProvider>(context, listen: false).loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    // Extract category names for dropdown
    List<String> categoryNames =
        categoryProvider.categories.map((cat) => cat.name).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Product",
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
              Text(
                "Product Name",
                style: AppTextStyles.subHeading(context),
              ),
              SizedBox(height: AppSizes.paddingSmallValue),
              ReusableTextField(
                labelText: "Enter product name",
                controller: productNameController,
              ),
        
              SizedBox(height: AppSizes.paddingMediumValue),

              Text(
                "Quantity",
                style: AppTextStyles.subHeading(context),
              ),
              SizedBox(height: AppSizes.paddingSmallValue),
              ReusableTextField(
                labelText: "Enter quantity",
                controller: productQuantityController,
              ),
        
              SizedBox(height: AppSizes.paddingMediumValue),
        
              // Category Dropdown
              Text(
                "Category",
                style: AppTextStyles.subHeading(context),
              ),
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
        
              // Rent / Sell Dropdown
              Text(
                "Selling Option",
                style: AppTextStyles.subHeading(context),
              ),
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
        
              // Category Dropdown
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
        
              // Category Dropdown
              Text(
                "Upload image",
                style: AppTextStyles.subHeading(context),
              ),
              SizedBox(height: AppSizes.paddingSmallValue),
        
              // Image Picker
              ReusableImagePicker(
                onImageSelected: (File? image) {
                  setState(() {
                    _selectedImage = image;
                  });
                },
              ),
        
              SizedBox(height: AppSizes.paddingMediumValue),
              
              ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusMediumValue),
            child: Container(
              color: AppColors.blueAccent(context),
              
              child: GestureDetector(
                onTap: _selectedImage == null
                    ? null
                    : () {
                        print("Image ready for upload: ${_selectedImage!.path}");
                        // TODO: Upload image to Supabase in future
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
                      Text("Upload", style: AppTextStyles.subHeading(context),)
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