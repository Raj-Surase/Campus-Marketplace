import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:campus_marketplace/utils/provider/theme_provider.dart';

class AppColors {
  // Define HSL colors for Light Theme
  static const HSLColor _lightPrimary = HSLColor.fromAHSL(1.0, 100, 0, 0.1);
  static const HSLColor _lightSecondary =
      HSLColor.fromAHSL(1.0, 150, 0.6, 0.45);
  static const HSLColor _lightBackground = HSLColor.fromAHSL(1.0, 0, 0.0, 0.98);
  static const HSLColor _lightCardBackground =
      HSLColor.fromAHSL(1.0, 0, 0.0, 0.88);
  static const HSLColor _lightContainerBackground =
      HSLColor.fromAHSL(1.0, 0, 0.0, 0.95);
  static const HSLColor _lightTextPrimary =
      HSLColor.fromAHSL(1.0, 0, 0.0, 0.15);
  static const HSLColor _lightTextSecondary =
      HSLColor.fromAHSL(1.0, 0, 0.0, 0.5);
  static const HSLColor _lightAccent = HSLColor.fromAHSL(1.0, 50, 1.0, 0.5);
  static const HSLColor _lightRedAccent = HSLColor.fromAHSL(1.0, 0, 0.8, 0.4);
  static const HSLColor _lightGreenAccent =
      HSLColor.fromAHSL(1.0, 120, 0.7, 0.35);
  static const HSLColor _lightBlueAccent =
      HSLColor.fromAHSL(1.0, 255, 0.7, 0.35);

  // Define HSL colors for Dark Theme
  static const HSLColor _darkPrimary = HSLColor.fromAHSL(1.0, 275, 0.8, 0.5);
  static const HSLColor _darkSecondary = HSLColor.fromAHSL(1.0, 275, 0.8, 0.2);
  static const HSLColor _darkBackground = HSLColor.fromAHSL(1.0, 0, 0.0, 0.0);
  static const HSLColor _darkCardBackground =
      HSLColor.fromAHSL(1.0, 0, 0.0, 0.1);
  static const HSLColor _darkContainerBackground =
      HSLColor.fromAHSL(1.0, 180, 0.17, 0.07);
  static const HSLColor _darkTextPrimary = HSLColor.fromAHSL(1.0, 0, 0.0, 0.9);
  static const HSLColor _darkTextSecondary =
      HSLColor.fromAHSL(1.0, 0, 0.0, 0.7);
  static const HSLColor _darkAccent = HSLColor.fromAHSL(1.0, 50, 1.0, 0.6);
  static const HSLColor _darkRedAccent = HSLColor.fromAHSL(1.0, 0, 1.0, 0.3);
  static const HSLColor _darkGreenAccent =
      HSLColor.fromAHSL(1.0, 120, 0.7, 0.25);
  static const HSLColor _darkBlueAccent = HSLColor.fromAHSL(1.0, 215, 1, 0.5);

  // Map HSL colors dynamically based on theme
  static Map<String, HSLColor> _getColors(bool isDarkTheme) {
    return isDarkTheme
        ? {
            'primary': _darkPrimary,
            'secondary': _darkSecondary,
            'background': _darkBackground,
            'cardBackground': _darkCardBackground,
            'containerBackground': _darkContainerBackground,
            'textPrimary': _darkTextPrimary,
            'textSecondary': _darkTextSecondary,
            'accent': _darkAccent,
            'redAccent': _darkRedAccent,
            'greenAccent': _darkGreenAccent,
            'blueAccent': _darkBlueAccent,
          }
        : {
            'primary': _lightPrimary,
            'secondary': _lightSecondary,
            'background': _lightBackground,
            'cardBackground': _lightCardBackground,
            'containerBackground': _lightContainerBackground,
            'textPrimary': _lightTextPrimary,
            'textSecondary': _lightTextSecondary,
            'accent': _lightAccent,
            'redAccent': _lightRedAccent,
            'greenAccent': _lightGreenAccent,
            'blueAccent': _lightBlueAccent,
          };
  }

  // Accessors for colors based on theme
  static Color primary(BuildContext context) => hslToColor(
      _getColors(Provider.of<ThemeProvider>(context).isDarkTheme)['primary']!);

  static Color secondary(BuildContext context) => hslToColor(_getColors(
      Provider.of<ThemeProvider>(context).isDarkTheme)['secondary']!);
  static Color background(BuildContext context) => hslToColor(_getColors(
      Provider.of<ThemeProvider>(context).isDarkTheme)['background']!);
  static Color cardBackground(BuildContext context) => hslToColor(_getColors(
      Provider.of<ThemeProvider>(context).isDarkTheme)['cardBackground']!);
  static Color containerBackground(BuildContext context) =>
      hslToColor(_getColors(Provider.of<ThemeProvider>(context).isDarkTheme)[
          'containerBackground']!);
  static Color textPrimary(BuildContext context) => hslToColor(_getColors(
      Provider.of<ThemeProvider>(context).isDarkTheme)['textPrimary']!);
  static Color textSecondary(BuildContext context) => hslToColor(_getColors(
      Provider.of<ThemeProvider>(context).isDarkTheme)['textSecondary']!);
  static Color accent(BuildContext context) => hslToColor(
      _getColors(Provider.of<ThemeProvider>(context).isDarkTheme)['accent']!);
  static Color redAccent(BuildContext context) => hslToColor(_getColors(
      Provider.of<ThemeProvider>(context).isDarkTheme)['redAccent']!);
  static Color greenAccent(BuildContext context) => hslToColor(_getColors(
      Provider.of<ThemeProvider>(context).isDarkTheme)['greenAccent']!);
  static Color blueAccent(BuildContext context) => hslToColor(_getColors(
      Provider.of<ThemeProvider>(context).isDarkTheme)['blueAccent']!);
  // Utility to convert HSL to Color
  static Color hslToColor(HSLColor hsl) => hsl.toColor();
}
