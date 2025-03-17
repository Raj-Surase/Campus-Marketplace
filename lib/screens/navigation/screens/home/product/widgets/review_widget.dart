import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/model/review.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
  final ReviewModel review;

  const ReviewWidget({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusLargeValue),
      child: Container(
        color: AppColors.containerBackground(context),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingMediumValue,
          vertical: AppSizes.paddingMediumValue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.borderRadiusRoundValue),
                  child: review.userPhoto != null
                      ? Image.network(
                          review.userPhoto!,
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          height: 40,
                          width: 40,
                          color: AppColors.blueAccent(context),
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                ),
                SizedBox(width: AppSizes.paddingSmallValue),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        review.userName,
                        style: AppTextStyles.body(context),
                      ),
                      Text(
                        review.userEmail,
                        style: AppTextStyles.caption(context),
                      ),
                    ],
                  ),
                ),
                StarRating(
                  rating: review.rating.toDouble(),
                  size: AppSizes.iconSizeSmallValue,
                ),
              ],
            ),
            SizedBox(height: AppSizes.paddingSmallValue),
            Text(
              review.comment,
              style: AppTextStyles.caption(context),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}


class StarRating extends StatelessWidget {
  final double rating; // Rating from 0.0 to 5.0
  final double size; // Size of stars
  // final Color filledColor;
  // final Color unfilledColor;

  const StarRating({
    Key? key,
    required this.rating,
    this.size = 24.0,
    // this.filledColor = Colors.yellow,
    // this.unfilledColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color filledColor = AppColors.accent(context);
  final Color unfilledColor = AppColors.textSecondary(context);

    int fullStars = rating.toInt(); // Convert rating to integer (ignore decimals)

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < fullStars ? Icons.star_rounded : Icons.star_border_rounded, // Full star or empty star
          size: size,
          color: index < fullStars ? filledColor : unfilledColor,
        );
      }),
    );
  }
}
