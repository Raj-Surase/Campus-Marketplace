import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/constants/app_sizes.dart';

class AppTextStyles {
  static double _responsiveFontSize(BuildContext context, double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      // Mobile
      return baseSize;
    } else if (screenWidth < 1024) {
      // Tablet
      return baseSize;
    } else {
      // Desktop
      return baseSize;
    }
  }

  static TextStyle uniqueText(BuildContext context) => GoogleFonts.lora(
        fontSize:
            _responsiveFontSize(context, AppSizes.fontSizeMediumLargeValue),
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary(context),
      );

  static TextStyle smallHeading(BuildContext context) => GoogleFonts.poppins(
        fontSize:
            _responsiveFontSize(context, AppSizes.fontSizeMediumLargeValue),
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary(context),
      );

  static TextStyle largeSubHeading(BuildContext context) => GoogleFonts.poppins(
        fontSize: _responsiveFontSize(context, AppSizes.fontSizeMediumValue),
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary(context),
      );

  static TextStyle subHeading(BuildContext context) => GoogleFonts.poppins(
        fontSize:
            _responsiveFontSize(context, AppSizes.fontSizeSmallMediumValue),
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary(context),
      );

  static TextStyle largeBody(BuildContext context) => GoogleFonts.poppins(
      fontSize: _responsiveFontSize(context, AppSizes.fontSizeMediumValue),
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary(context),
      letterSpacing: 1,
      wordSpacing: 2,
      height: 2,
      textStyle: TextStyle(
        overflow: TextOverflow.ellipsis,
      ));

  static TextStyle body(BuildContext context) => GoogleFonts.poppins(
        fontSize:
            _responsiveFontSize(context, AppSizes.fontSizeSmallValue),
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary(context),
        letterSpacing: 1,
        wordSpacing: 2,
        height: 2,
      );

  static TextStyle caption(BuildContext context) => GoogleFonts.poppins(
        fontSize: _responsiveFontSize(context, AppSizes.fontSizeSSValue),
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary(context),
        height: 2,
      );
}
