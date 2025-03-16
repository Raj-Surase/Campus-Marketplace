import 'package:campus_marketplace/utils/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/constants/router.dart';
import 'package:campus_marketplace/screens/authentication/authentication_vm.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';
import 'package:campus_marketplace/utils/widgets/action_text_button.dart';
import 'package:campus_marketplace/utils/widgets/reusable_textfield.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // SizedBox(
          //   height: AppSizes.screenHeight(context)*0.5,
          //   width: AppSizes.screenWidth(context),
          //   child: Image.asset(AppAssets.boy_with_computer,fit: BoxFit.cover,),
          // ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSizes.paddingXLargeValue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Campus Marketplace",
                    style: AppTextStyles.smallHeading(context).copyWith(
                      color: AppColors.textPrimary(context),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSizes.paddingLargeValue,
                ),
                Text(
                  "Log in to the campus_marketplace to start earning free rewards!",
                  style: AppTextStyles.body(context)
                      .copyWith(color: AppColors.textSecondary(context)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
            height: AppSizes.screenHeight(context)*0.3,
            width: AppSizes.screenWidth(context)*0.8,
            child: Image.asset(AppAssets.boy_with_computer,fit: BoxFit.cover,),
          ),
                SizedBox(
                  height: AppSizes.screenHeight(context) * 0.1,
                ),
                ActionTextButton(
                  color: AppColors.primary(context),
                  onTap: () async {
                    final authProvider = Provider.of<AuthenticationViewModel>(
                      context,
                      listen: false,
                    );

                    final userCredential =
                        await authProvider.signInWithGoogle();

                    if (userCredential != null) {
                      debugPrint(
                          "Signed in successfully: ${userCredential.user?.displayName}");
                    } else {
                      debugPrint("Sign-in failed");
                    }
                  },
                  icon: Icons.g_mobiledata,
                  title: "Sign in with Google",
                  radius: AppSizes.borderRadiusSmallValue,
                ),
                SizedBox(
                  height: AppSizes.paddingLargeValue,
                ),
                Text(
                  "By signing in you are accepting our TERMS AND CONDITION and PRIVACY POLICY",
                  style: AppTextStyles.caption(context),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
