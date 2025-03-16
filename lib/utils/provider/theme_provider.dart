import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkTheme = true; // Default to dark theme

  // Getter for theme mode
  ThemeMode get themeMode => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  // Getter for checking if dark mode is enabled
  bool get isDarkTheme => _isDarkTheme;

  // Toggle theme between light and dark
  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners(); // Notify all listeners of the change
  }

  // ThemeData with context dependency
  ThemeData getTheme(BuildContext context) {
    return _isDarkTheme ? darkTheme(context) : lightTheme(context);
  }

  // Light theme definition
  ThemeData lightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary(context), // Example usage
        scaffoldBackgroundColor: AppColors.background(context),
        cardColor: AppColors.cardBackground(context),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: AppColors.textPrimary(context)),
          bodyMedium: TextStyle(color: AppColors.textSecondary(context)),
        ),
        appBarTheme: AppBarTheme(
          color: AppColors.background(context),
          
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.background(context),
        ),
      );

  // Dark theme definition
  ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primary(context),
        scaffoldBackgroundColor: AppColors.background(context),
        cardColor: AppColors.cardBackground(context),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: AppColors.textPrimary(context)),
          bodyMedium: TextStyle(color: AppColors.textSecondary(context)),
        ),
        appBarTheme: AppBarTheme(
          color: AppColors.background(context),
          surfaceTintColor: Colors.transparent,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.background(context),
        ),
      );
}
