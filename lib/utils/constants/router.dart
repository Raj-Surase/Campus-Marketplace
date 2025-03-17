import 'package:campus_marketplace/screens/navigation/screens/home/product/add_product/add_product_screen.dart';
import 'package:campus_marketplace/screens/navigation/screens/dashboard/dashboard_screen.dart';
import 'package:campus_marketplace/screens/navigation/screens/home/product/product_screen.dart';
import 'package:campus_marketplace/screens/navigation/screens/notification/notification_screen.dart';
import 'package:campus_marketplace/utils/model/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:campus_marketplace/screens/authentication/authentication_screen.dart';
import 'package:campus_marketplace/screens/navigation/navigation_screen.dart';
import 'package:campus_marketplace/screens/navigation/screens/home/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:campus_marketplace/screens/splash_screen/splash_screen.dart';
import 'package:campus_marketplace/screens/authentication/authentication_vm.dart';

class AppRoutes {
  AppRoutes._();

  static const String initialRoute = "/";
  static const String authenticationRoute = "/auth";
  static const String homeRoute = "/home";
  static const String productRoute = "/product";
  static const String addProductRoute = "/create";

  static const String dashboardRoute = "/dashboard";

  static const String notificationRoute = "/notification";

  static final GoRouter router = GoRouter(
    initialLocation: initialRoute,
    refreshListenable: _RouterRefreshNotifier(),
    routes: [
      GoRoute(
        path: initialRoute,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: authenticationRoute,
        builder: (context, state) => AuthenticationScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => NavigationScreen(child: child),
        routes: [
          GoRoute(
            path: homeRoute,
            builder: (context, state) => HomeScreen(),
          ),
          GoRoute(
            path: dashboardRoute,
            builder: (context, state) => DashboardScreen(),
          ),
          GoRoute(
            path: notificationRoute,
            builder: (context, state) => NotificationScreen(),
          ),
        ],
      ),
      GoRoute(
  path: AppRoutes.productRoute,
  builder: (context, state) {
    final product = state.extra as ProductModel; // Extract passed product
    return ProductScreen(product: product);
  },
),

GoRoute(
  path: AppRoutes.addProductRoute,
  builder: (context, state) {
    
    return AddProductScreen();
  },
),

    ],
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      final isAuthenticated = user != null;
      final isOnAuthScreen = state.matchedLocation == authenticationRoute;

      if (!isAuthenticated && !isOnAuthScreen) {
        return authenticationRoute; // Redirect to login if not authenticated
      }
      if (isAuthenticated && isOnAuthScreen) {
        return homeRoute; // Redirect logged-in users to home
      }
      return null;
    },
  );
}

class _RouterRefreshNotifier extends ChangeNotifier {
  _RouterRefreshNotifier() {
    FirebaseAuth.instance.authStateChanges().listen((_) {
      notifyListeners();
    });
  }
}
