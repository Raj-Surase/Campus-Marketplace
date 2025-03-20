import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/model/product.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';
import 'package:campus_marketplace/utils/widgets/dialogs/confirm_delete_dialog.dart';
import 'package:flutter/material.dart';

class DashboardProductWidget extends StatefulWidget {
  final ProductModel product;
  const DashboardProductWidget({super.key, required this.product});

  @override
  State<DashboardProductWidget> createState() => _DashboardProductWidgetState();
}

class _DashboardProductWidgetState extends State<DashboardProductWidget> {
  late bool isAvailable;

  @override
  void initState() {
    super.initState();
    isAvailable = widget.product.isAvailable;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusMediumValue),
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
                      widget.product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: AppSizes.paddingSmallValue),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: AppTextStyles.body(context),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        "Interested - ${widget.product.reviewIds.length}",
                        style: AppTextStyles.caption(context),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () async {
                        // Handle edit action
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
              ],
            ),
            SizedBox(height: AppSizes.paddingSmallValue),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Available",
                  style: AppTextStyles.body(
                    context,
                  ).copyWith(color: AppColors.textSecondary(context)),
                ),
                SizedBox(width: 10),
                Switch(
                  value: isAvailable,
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
