import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';
import 'package:campus_marketplace/utils/widgets/action_text_button.dart';

Future<dynamic> must_read_dialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusLargeValue),
        ),
        insetPadding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingMediumValue,
          vertical: AppSizes.paddingLargeValue,
        ),
        backgroundColor: AppColors.containerBackground(context),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.paddingLargeValue),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                Text(
                  "Must Read Before You Earn Rewards!",
                  style: AppTextStyles.largeSubHeading(context),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppSizes.paddingMediumValue),

                /// Processing Time
                Text(
                  "⏳ Processing Time",
                  style: AppTextStyles.body(context)
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: AppSizes.paddingSmallValue),
                Text(
                  "• Once you place an order, it can take up to or more than 24 hours to process your transaction.\n"
                  "• This delay is because we manually verify and process payments to keep the app safe and secure.",
                  style: AppTextStyles.caption(context),
                ),

                SizedBox(height: AppSizes.paddingMediumValue),

                /// Receiving Reward
                Text(
                  "📩 Receiving Your Reward",
                  style: AppTextStyles.body(context)
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: AppSizes.paddingSmallValue),
                Text(
                  "• After your transaction is successfully completed, you will receive your reward code in the app and via email.\n"
                  "• 🚨 Important: Do not uninstall the app until you receive your reward, or you might lose access to it!",
                  style: AppTextStyles.caption(context),
                ),

                SizedBox(height: AppSizes.paddingMediumValue),

                /// Refund Policy
                Text(
                  "🔄 Refund Policy",
                  style: AppTextStyles.body(context)
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: AppSizes.paddingSmallValue),
                Text(
                  "• If, for any reason, we are unable to process your transaction, your amount will be refunded.",
                  style: AppTextStyles.caption(context),
                ),

                SizedBox(height: AppSizes.paddingMediumValue),

                /// Support
                Text(
                  "❓ Need Help?",
                  style: AppTextStyles.body(context)
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: AppSizes.paddingSmallValue),
                Text(
                  "• Have a question or issue? Raise a ticket in the Support/Ticket section, and our team will assist you as soon as possible.",
                  style: AppTextStyles.caption(context),
                ),

                SizedBox(height: AppSizes.paddingLargeValue),

                /// Close Button
                ActionTextButton(
                  color: AppColors.greenAccent(context),
                  onTap: () {
                    context.pop(1);
                  },
                  radius: AppSizes.borderRadiusSmallValue,
                  title: "I accept",
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
