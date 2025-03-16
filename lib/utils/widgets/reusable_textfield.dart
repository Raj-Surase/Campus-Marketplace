import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isPasswordField;
  final String? Function(String?)? validator;

  const ReusableTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.isPasswordField = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPasswordField,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorRadius: Radius.circular(
        AppSizes.borderRadiusSmallValue,
      ),
      style: AppTextStyles.body(context).copyWith(
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        fillColor: AppColors.background(context),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppSizes.borderRadiusSmallValue,
          ),
          borderSide: BorderSide(
            color: AppColors.containerBackground(context),
            width: 3,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textSecondary(context),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(
            AppSizes.borderRadiusSmallValue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.containerBackground(context),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
            AppSizes.borderRadiusSmallValue,
          ),
        ),
        errorStyle: AppTextStyles.body(context).copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.redAccent(context).withRed(200),
        ),
        label: Text(
          labelText,
          style: AppTextStyles.body(context).copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      cursorHeight: 20,
      validator: validator,
    );
  }
}
