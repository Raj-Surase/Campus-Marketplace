import 'package:flutter/material.dart';
import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';

class IconTextTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const IconTextTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingSmallValue,
      ),
      child: ListTile(
        onTap: onTap,
        tileColor: AppColors.containerBackground(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMediumValue),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingMediumValue,
          vertical: AppSizes.paddingSmallValue,
        ),
        leading: Icon(
          icon,
          size: AppSizes.iconSizeMediumValue,
          color: AppColors.textPrimary(context),
        ),
        title: Text(
          title,
          style: AppTextStyles.body(context),
        ),
      ),
    );
  }
}
