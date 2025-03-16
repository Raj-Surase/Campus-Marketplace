import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class ActionTextButton extends StatefulWidget {
  String? title;
  final Color color;
  final Color? iconColor;
  final VoidCallback onTap;
  final IconData? icon;
  final double radius;
  bool isLoading;
  ActionTextButton({
    super.key,
    this.title,
    required this.color,
    required this.onTap,
    this.icon,
    this.iconColor,
    this.radius = 100,
    this.isLoading = false,
  });
  @override
  // ignore: library_private_types_in_public_api
  _ActionTextButtonState createState() => _ActionTextButtonState();
}

class _ActionTextButtonState extends State<ActionTextButton> {
  // ignore: unused_field
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.radius),
          child: Container(
            color: _isHovered ? widget.color.withOpacity(0.8) : widget.color,
            padding: const EdgeInsets.fromLTRB(24, 5, 24, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.icon != null
                    ? Icon(
                        widget.icon,
                        size: AppSizes.iconSizeSmallValue,
                        color: widget.iconColor,
                      )
                    : SizedBox(),
                SizedBox(
                  width: widget.title == null || widget.icon == null ? 0 : 8,
                ),
                widget.isLoading
                    ? SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(),
                      )
                    : widget.title != null
                        ? Text(
                            widget.title.toString(),
                            style: AppTextStyles.body(context)
                                .copyWith(fontWeight: FontWeight.bold),
                          )
                        : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
