import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';

class ReusableDropdown extends StatelessWidget {
  final String? selectedValue;
  final List<String> items;
  final Map<String, dynamic> valueMap;
  final String labelText;
  final ValueChanged<String?> onChanged;
  final List<String>? icons; // New optional icon parameter

  const ReusableDropdown({
    Key? key,
    required this.selectedValue,
    required this.items,
    required this.valueMap,
    required this.labelText,
    required this.onChanged,
    this.icons, // Icons are optional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      iconSize: AppSizes.iconSizeMediumValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppSizes.borderRadiusSmallValue,
          ),
          borderSide: BorderSide(
            color: AppColors.cardBackground(context),
            width: 3,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textSecondary(context),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(
            AppSizes.borderRadiusSmallValue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.cardBackground(context),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
            AppSizes.borderRadiusSmallValue,
          ),
        ),
        alignLabelWithHint: false,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        label: Text(
          labelText,
          style: AppTextStyles.body(context).copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      dropdownColor: AppColors.cardBackground(context),
      items: List.generate(items.length, (index) {
        return DropdownMenuItem<String>(
          value: items[index],
          child: Row(
            children: [
              if (icons != null && index < icons!.length) ...[
                SizedBox(
                  height: AppSizes.iconSizeSmallValue,
                  width: AppSizes.iconSizeSmallValue,
                  child: SvgPicture.network(
                    icons![index],
                  ),
                ),
                SizedBox(width: AppSizes.paddingSmallValue),
              ],
              Text(
                items[index],
                style: AppTextStyles.body(context).copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      }),
      onChanged: onChanged,
    );
  }
}
