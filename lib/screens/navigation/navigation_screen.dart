import 'package:campus_marketplace/screens/authentication/authentication_vm.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:campus_marketplace/screens/navigation/screens/profile/profile_dialog.dart';
import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/constants/router.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';

class NavigationScreen extends StatelessWidget {
  final Widget child;
  const NavigationScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    AuthenticationViewModel authenticationProvider =
        Provider.of<AuthenticationViewModel>(context);
    final user = authenticationProvider.firebaseUser;

    NavigationProvider navigationProvider =
        Provider.of<NavigationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: AppSizes.paddingXSmallValue,
            ),
            Text(
              "Campus Marketplace",
              style: AppTextStyles.smallHeading(context),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push(AppRoutes.addProductRoute);
            },
            icon: Icon(
              Icons.add_circle_outline_rounded,
              size: AppSizes.iconSizeMediumValue,
              color: AppColors.textPrimary(context),
            ),
          ),
          
                    
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ProfileDialog();
                },
              );
            },
            icon: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          AppSizes.borderRadiusRoundValue),
                      child: user?.photoURL != null
                          ? Image.network(
                              user!.photoURL!,
                              height: AppSizes.iconSizeMediumValue,
                              width: AppSizes.iconSizeMediumValue,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              height: 40,
                              width: 40,
                              color: AppColors.blueAccent(context),
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                    ),
          ),
          SizedBox(
            width: AppSizes.paddingXSmallValue,
          ),
        ],
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: AppTextStyles.body(context).copyWith(
          color: AppColors.textPrimary(context),
        ),
        unselectedLabelStyle: AppTextStyles.caption(context).copyWith(
          color: AppColors.textSecondary(context),
          fontWeight: FontWeight.w400,
        ),
        selectedIconTheme: IconThemeData(
          color: AppColors.textPrimary(context),
          size: AppSizes.iconSizeSmallValue * 1.2,
        ),
        unselectedIconTheme: IconThemeData(
          color: AppColors.textSecondary(context),
          size: AppSizes.iconSizeSmallValue,
        ),
        currentIndex: navigationProvider.selectedIndex,
        onTap: (index) => navigationProvider.setIndex(context, index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label: "Notification",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            label: "Dashboard",
          ),
        ],
      ),
    );
  }
}

class NavigationProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(BuildContext context, int index) {
    _selectedIndex = index;
    notifyListeners();

    // Navigate to the corresponding route
    switch (index) {
      case 0:
        context.go(AppRoutes.homeRoute);
        break;
      case 1:
        context.go(AppRoutes.notificationRoute);
        break;
      case 2:
        context.go(AppRoutes.dashboardRoute);
        break;
    }
  }
}
