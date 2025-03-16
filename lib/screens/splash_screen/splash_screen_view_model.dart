import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:campus_marketplace/utils/constants/router.dart';
import 'package:campus_marketplace/screens/authentication/authentication_vm.dart';
import 'package:campus_marketplace/utils/local_storage/local_storage.dart';

class SplashViewModel extends ChangeNotifier {
  final BuildContext context;

  SplashViewModel(this.context);

  /// Navigate to a specific route
  void navigateTo() {
    Future.delayed(const Duration(seconds: 2), () {
      context.go(AppRoutes.authenticationRoute);
    });
  }
}
