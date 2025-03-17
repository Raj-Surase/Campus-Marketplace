import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';
import 'package:campus_marketplace/utils/widgets/dialogs/confirm_delete_dialog.dart';
import 'package:flutter/material.dart';

class DashboardProductWidget extends StatefulWidget {
  const DashboardProductWidget({
    super.key,
  });

  @override
  State<DashboardProductWidget> createState() => _DashboardProductWidgetState();
}

class _DashboardProductWidgetState extends State<DashboardProductWidget> {
  bool isAvailable = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        AppSizes.borderRadiusMediumValue,
      ),
      child: Container(
        color: AppColors.containerBackground(context),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingSmallValue,
          vertical: AppSizes.paddingSmallValue,
        ),
        child: Column(
          children: [
            Row(
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
                      "Product Name",
                      style: AppTextStyles.body(context),
                    ),
                    Text(
                      "Interested - 10",
                      style: AppTextStyles.caption(context),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  onPressed: () async {
                    
                  },
                   icon: Icon(
                    Icons.edit,
                    size: AppSizes.iconSizeSmallValue,
                    color: AppColors.textPrimary(context),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await showConfirmDeleteDialog(context);
                  },
                   icon: Icon(
                    Icons.delete,
                    size: AppSizes.iconSizeSmallValue,
                    color: AppColors.redAccent(context),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppSizes.paddingMediumValue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Available",
                  style: AppTextStyles.subHeading(context).copyWith(
                    color: AppColors.textSecondary(context),
                  ),
                ),
                SizedBox(width: 10), // Adds spacing between text and switch
                Switch(
                  value: isAvailable, // This should be a boolean variable
                  onChanged: (value) {
                    setState(() {
                      isAvailable = value;
                    });
                  },
                  activeColor: AppColors.primary(context),
                  thumbColor: WidgetStatePropertyAll(
                    AppColors.textSecondary(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}