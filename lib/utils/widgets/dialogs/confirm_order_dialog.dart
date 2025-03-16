import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';
import 'package:campus_marketplace/utils/widgets/action_text_button.dart';

Future<dynamic> confirm_order_dialog(BuildContext context) {
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
        child: Padding(
          padding: EdgeInsets.all(AppSizes.paddingLargeValue),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                color: AppColors.background(context),
              ),
              SizedBox(
                height: AppSizes.paddingMediumValue,
              ),
              Text(
                "Confirm Order",
                style: AppTextStyles.largeBody(context).copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: AppSizes.paddingSmallValue,
              ),
              Text(
                "Do you want to confirm your order?",
                style: AppTextStyles.body(context),
              ),
              SizedBox(
                height: AppSizes.paddingMediumValue,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ActionTextButton(
                      color: AppColors.cardBackground(context),
                      onTap: () {
                        context.pop(0);
                      },
                      title: "Cancel",
                      radius: AppSizes.borderRadiusSmallValue,
                    ),
                  ),
                  SizedBox(
                    width: AppSizes.borderRadiusMediumValue,
                  ),
                  Expanded(
                    child: ActionTextButton(
                      color: AppColors.blueAccent(context),
                      onTap: () {
                        context.pop(1);
                      },
                      title: "Confirm",
                      radius: AppSizes.borderRadiusSmallValue,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
