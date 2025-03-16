import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  const CategoryButton({
    super.key,
    required this.title,
    required this.onTap,
  });
  @override
  // ignore: library_private_types_in_public_api
  _CategoryButtonState createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  // ignore: unused_field
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      // child: MouseRegion(
      //   onEnter: (_) => setState(() => _isHovered = true),
      //   onExit: (_) => setState(() => _isHovered = false),
      //   cursor: SystemMouseCursors.click,
    child: Container(
      margin: EdgeInsets.only(
        right: 10,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: _isHovered
              ? AppColors.cardBackground(context).withOpacity(0.8)
              : AppColors.cardBackground(context),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingMediumValue,
            vertical: AppSizes.paddingXSmallValue,
          ),
            child: Text(
              widget.title,
              style: AppTextStyles.caption(context).copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
        // ),
      
    );
  }
}
