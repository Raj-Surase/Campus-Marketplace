  import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';
import 'package:campus_marketplace/utils/widgets/action_text_button.dart';
import 'package:flutter/material.dart';

Future<bool?> showConfirmDeleteDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: AppColors.containerBackground(context),
          backgroundColor: AppColors.containerBackground(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title:  Text(
            'Confirm Delete',
            style: AppTextStyles.largeSubHeading(context),
            ),
          content: Text(
            'Are you sure you want to delete this item?',
            style: AppTextStyles.caption(context),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ActionTextButton(
                  color: AppColors.cardBackground(context),
                  onTap: () {
                    Navigator.of(context).pop(false);
                  },
                  iconColor: AppColors.textPrimary(context),
                  title: "Cancel",
                ),
                SizedBox(
                  width: AppSizes.paddingMediumValue,
                ),
                ActionTextButton(
                  color: AppColors.redAccent(context),
                  onTap: () {
                    Navigator.of(context).pop(true);
                  },
                  iconColor: AppColors.textPrimary(context),
                  title: "Delete",
                ),
              ],
            ),
          ],
        );
      },
    );
  }
