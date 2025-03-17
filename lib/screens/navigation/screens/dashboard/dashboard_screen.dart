import 'package:campus_marketplace/screens/navigation/screens/dashboard/dashboard_product/dashboard_product_screen.dart';
import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';
import 'package:campus_marketplace/utils/widgets/dialogs/confirm_delete_dialog.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 0,
          bottom: TabBar(
              // dividerColor: AppColors.textPrimary(context),
              tabs: [
                Tab(
                  child: Text(
                    "Products",
                    style: AppTextStyles.body(context).copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Notification",
                    style: AppTextStyles.body(context).copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
        ),
        body: TabBarView(
          children:[
            DashboardProductsScreen(),
            Placeholder(),
          ],
        ),
      ),
    );
  }
}