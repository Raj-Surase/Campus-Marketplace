import 'package:campus_marketplace/screens/authentication/authentication_vm.dart';
import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/model/product.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';
import 'package:campus_marketplace/utils/widgets/action_text_button.dart';
import 'package:campus_marketplace/utils/widgets/category_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel product;

  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {

    AuthenticationViewModel authenticationProvider =
        Provider.of<AuthenticationViewModel>(context);
    final user = authenticationProvider.firebaseUser;

    return Scaffold(
      appBar: AppBar(
        // title: Text(product.name,style: AppTextStyles.body(context),),
        automaticallyImplyLeading: true,
        // centerTitle: false,
        // titleSpacing: 0,
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
              widget.product.isLiked = !widget.product.isLiked; 
              });
            }, 
          icon: Icon(
                      widget.product.isLiked ? Icons.favorite : Icons.favorite_border,
                      color: widget.product.isLiked ? AppColors.redAccent(context) : AppColors.textSecondary(context),
                      size: AppSizes.iconSizeSmallValue,
                    ),
          color: AppColors.textPrimary(context),
          
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingSmallValue,
          vertical: AppSizes.paddingSmallValue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusMediumValue),
              child: Center(
                child: Image.network(
                  widget.product.imageUrl,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, size: 100),
                ),
              ),
            ),
            SizedBox(height: AppSizes.paddingSmallValue),

            Row(
              children: [
                CategoryButton(title: "Electronics", onTap: (){},),
                CategoryButton(title: "Rents", onTap: (){},),
              ],
            ),

          SizedBox(height: AppSizes.paddingSmallValue),

            // Product Name
            Text(
              widget.product.name,
              style: AppTextStyles.largeSubHeading(context),
            ),
            
            SizedBox(height: AppSizes.paddingXSmallValue),

            // Product Description
            Text(
              widget.product.description,
              style: AppTextStyles.caption(context),
            ),
            SizedBox(height: AppSizes.paddingMediumValue),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Ratings",
                style: AppTextStyles.largeSubHeading(context),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizes.borderRadiusLargeValue),
                  
                  border: Border.all(
                    color: AppColors.textSecondary(context),
                    width: 2,
                  ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingSmallValue,
                  vertical: 6,),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_rounded,
                      size: AppSizes.iconSizeSmallValue,
                      color: AppColors.accent(context),
                      ),
                      SizedBox(
                        width: AppSizes.paddingXSmallValue,
                      ),
                      Text("4.8",
                      style: AppTextStyles.subHeading(context),),
                    ],
                  ),
                )
              ],
            ),

            SizedBox(height: AppSizes.paddingSmallValue,),

            ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.borderRadiusLargeValue),
              child: Container(
                color: AppColors.containerBackground(context),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingMediumValue,
                  vertical: AppSizes.paddingMediumValue,
                ),
                child: Column(
                  children: [
                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                      AppSizes.borderRadiusRoundValue),
                                          child: user?.photoURL != null
                      ? Image.network(
                          user!.photoURL!,
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
                                                                user?.displayName ?? "User name",
                                                                style: AppTextStyles.body(context),
                                                              ),
                                                              Text(
                                                                user?.email ?? "user@gmail.com",
                                                                style: AppTextStyles.caption(context),
                                                              ),
                                                                    ],
                                                                  ),
                                        ),
                        StarRating(rating: 3, size: AppSizes.iconSizeSmallValue,),
                      ],
                    ),
                    SizedBox(height: AppSizes.paddingSmallValue,),

                    Text(
                      "This is a great product, really helped me in the days and also appreciate the help.",
                      style: AppTextStyles.caption(context),
                      ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Product Price
    Text(
      "\$${widget.product.price.toStringAsFixed(2)}",
      style: AppTextStyles.smallHeading(context).copyWith(
        color: AppColors.textPrimary(context),
        fontWeight: FontWeight.w700,
      ),
    ),
    
      TextButton(onPressed: (){}, child: Text(
        "Add to cart",
        style: AppTextStyles.body(context),
      ),),
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
