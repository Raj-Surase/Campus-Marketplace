import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.paddingSmallValue,
        vertical: AppSizes.paddingMediumValue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
      borderRadius: BorderRadius.circular(
        AppSizes.borderRadiusMediumValue,
      ),
      child: Container(
        color: AppColors.containerBackground(context),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingSmallValue,
          vertical: AppSizes.paddingSmallValue,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                AppSizes.borderRadiusSmallValue,
              ),
              child: SizedBox(
                  height: AppSizes.iconSizeLargeValue,
                  width: AppSizes.iconSizeLargeValue,
                child: Image.network(
                  "https://images.unsplash.com/photo-1593642634367-d91a135587b5",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: AppSizes.paddingSmallValue,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Raj Surase",
                  style: AppTextStyles.body(context),
                ),
                Text(
                  "Interested in Product Name.",
                  style: AppTextStyles.caption(context),
                ),
              ],
            ),
            Spacer(),
            TextButton(
              onPressed: () async {
                
              },
               child: Text(
                "Chat",
                style: AppTextStyles.body(context).copyWith(
                  fontWeight: FontWeight.w800,
                ),
               ),
               style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  AppColors.blueAccent(context),
                ),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(
                    horizontal: AppSizes.paddingMediumValue,
                    vertical: 8,
                  ),
                ),
               ),
            ),
            // IconButton(
            //   onPressed: () async {
            //     await showConfirmDeleteDialog(context);
            //   },
            //    icon: Icon(
            //     Icons.delete,
            //     size: AppSizes.iconSizeSmallValue,
            //     color: AppColors.redAccent(context),
            //   ),
            // ),
          ],
        ),
      ),
    ),
        ],
      ),
    );
  }
}