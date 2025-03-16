import 'package:flutter/material.dart';

class AppSizes {
  // Static constants for default values
  static const double paddingXSmallValue = 8.0;
  static const double paddingSmallValue = 16.0;
  static const double paddingMediumValue = 24.0;
  static const double paddingLargeValue = 30.0;
  static const double paddingXLargeValue = 40.0;

  static const double fontSizeXSValue = 8.0;
  static const double fontSizeSSValue = 10.0;
  static const double fontSizeSmallValue = 12.0;
  static const double fontSizeSmallMediumValue = 14.0;
  static const double fontSizeMediumValue = 18.0;
  static const double fontSizeMediumLargeValue = 22.0;
  static const double fontSizeSmallLargeValue = 26.0;
  static const double fontSizeLargeValue = 30.0;

  static const double borderRadiusSmallValue = 12.0;
  static const double borderRadiusMediumValue = 20.0;
  static const double borderRadiusMedLargeValue = 30.0;
  static const double borderRadiusLargeValue = 40.0;
  static const double borderRadiusRoundValue = 100.0;

  static const double iconSizeSmallValue = 24.0;
  static const double iconSizeMediumValue = 32.0;
  static const double iconSizeLargeValue = 48.0;

  // Get screen dimensions for responsive scaling
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // Utility to calculate responsive value
}
