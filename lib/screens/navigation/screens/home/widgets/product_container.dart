import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/constants/router.dart';
import 'package:campus_marketplace/utils/model/product.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductContainer extends StatefulWidget {
  final ProductModel product;

  ProductContainer({required this.product, Key? key}) : super(key: key);

  @override
  State<ProductContainer> createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.product.isAvailable ? 1.0 : 0.5, // Reduce opacity if not available
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        child: GestureDetector(
          onTap: () {
            if (widget.product.isAvailable) {
              context.push(AppRoutes.productRoute, extra: widget.product);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              AspectRatio(
                aspectRatio: 4 / 6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.product.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, size: 100),
                  ),
                ),
              ),
              SizedBox(height: 8),

              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.product.name,
                          style: AppTextStyles.body(context).copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          "${widget.product.price}\$",
                          style: AppTextStyles.caption(context).copyWith(
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),

                  // Favorite Icon
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppSizes.borderRadiusLargeValue),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.product.isLiked = !widget.product.isLiked;
                          });
                        },
                        child: Container(
                          color: AppColors.cardBackground(context),
                          child: Center(
                            child: Icon(
                              widget.product.isLiked ? Icons.favorite : Icons.favorite_border,
                              color: widget.product.isLiked ? AppColors.redAccent(context) : AppColors.textSecondary(context),
                              size: AppSizes.iconSizeSmallValue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
