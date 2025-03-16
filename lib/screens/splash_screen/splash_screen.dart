import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:campus_marketplace/screens/splash_screen/splash_screen_view_model.dart';
import 'package:campus_marketplace/utils/constants/router.dart';
import 'package:campus_marketplace/screens/authentication/authentication_vm.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashViewModel _splashViewModel;

  @override
  void initState() {
    super.initState();
    _splashViewModel = SplashViewModel(context);
    _splashViewModel.navigateTo();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 300,
        color: AppColors.containerBackground(context),
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
