import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/constants/router.dart';
import 'package:campus_marketplace/screens/authentication/authentication_vm.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';
import 'package:campus_marketplace/utils/widgets/action_text_button.dart';

class ProfileDialog extends StatelessWidget {
  const ProfileDialog({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationViewModel authenticationProvider =
        Provider.of<AuthenticationViewModel>(context);
    final user = authenticationProvider.firebaseUser;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusLargeValue),
      ),
      insetPadding: EdgeInsets.symmetric(
        horizontal: AppSizes.paddingMediumValue,
        vertical: AppSizes.paddingLargeValue,
      ),
      backgroundColor: AppColors.containerBackground(context),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingSmallValue,
          vertical: AppSizes.paddingSmallValue,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title Section
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    size: AppSizes.iconSizeSmallValue,
                  ),
                ),
                SizedBox(width: AppSizes.paddingXSmallValue),
                Text(
                  "campus_marketplace",
                  style: AppTextStyles.largeSubHeading(context),
                ),
              ],
            ),

            SizedBox(height: AppSizes.paddingXSmallValue),

            // Content Section
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(AppSizes.borderRadiusRoundValue),
              child: Container(
                color: AppColors.cardBackground(context),
                padding: EdgeInsets.symmetric(
                  vertical: AppSizes.paddingSmallValue,
                  horizontal: AppSizes.paddingMediumValue,
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          AppSizes.borderRadiusRoundValue),
                      child: user?.photoURL != null
                          ? Image.network(
                              user!.photoURL!,
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              height: 40,
                              width: 40,
                              color: AppColors.blueAccent(context),
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                    ),
                    SizedBox(width: AppSizes.paddingSmallValue),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          user?.displayName ?? "User name",
                          style: AppTextStyles.body(context),
                        ),
                        Text(
                          user?.email ?? "user@gmail.com",
                          style: AppTextStyles.caption(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: AppSizes.paddingMediumValue),

            // Actions Section
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ActionTextButton(
                        color: AppColors.redAccent(context),
                        onTap: () {
                          authenticationProvider.signOut();
                          context.pop(true);
                        },
                        iconColor: AppColors.textPrimary(context),
                        title: "Logout",
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: AppSizes.paddingXSmallValue),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Privacy Policy",
                        style: AppTextStyles.caption(context),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          AppSizes.borderRadiusRoundValue),
                      child: Container(
                        height: 5,
                        width: 5,
                        color: AppColors.textPrimary(context),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Terms & Conditions",
                        style: AppTextStyles.caption(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
