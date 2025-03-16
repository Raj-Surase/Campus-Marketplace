import 'package:flutter/material.dart';

class ScreenBreakpoints {
  static const double mobileSmall = 450;
  static const double mobile = 750; // Max width for mobile
  static const double tablet = 1024; // Max width for tablets
  static const double desktop = 1440; // Min width for desktops
}

enum ScreenType { mobileSmall, mobile, tablet, desktop }

class ResponsiveUtil {
  static ScreenType getScreenType(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < ScreenBreakpoints.mobileSmall) {
      return ScreenType.mobileSmall;
    } else if (width < ScreenBreakpoints.mobile) {
      return ScreenType.mobile;
    } else if (width < ScreenBreakpoints.tablet) {
      return ScreenType.tablet;
    } else {
      return ScreenType.desktop;
    }
  }
}
