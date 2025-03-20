import 'package:campus_marketplace/screens/authentication/authentication_vm.dart';
import 'package:campus_marketplace/screens/navigation/screens/home/product/widgets/review_widget.dart';
import 'package:campus_marketplace/utils/constants/app_sizes.dart';
import 'package:campus_marketplace/utils/model/product.dart';
import 'package:campus_marketplace/utils/model/review.dart';
import 'package:campus_marketplace/utils/model/user.dart';
import 'package:campus_marketplace/utils/provider/category_provider.dart';
import 'package:campus_marketplace/utils/provider/review_provider.dart';
import 'package:campus_marketplace/utils/provider/user_provider.dart';
import 'package:campus_marketplace/utils/styles/app_colors.dart';
import 'package:campus_marketplace/utils/styles/app_text_styles.dart';
import 'package:campus_marketplace/utils/widgets/action_text_button.dart';
import 'package:campus_marketplace/utils/widgets/category_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel product;

  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late UserProvider _userProvider;
  UserModel? _productOwner;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    _fetchProductOwner();
  }

  void initState() {
    super.initState();
    // Fetch reviews when screen initializes
    Future.microtask(
      () => Provider.of<ReviewProvider>(context, listen: false).loadReviews(),
    );
  }

  Future<void> _fetchProductOwner() async {
    await _userProvider.fetchUserByFirebaseUid(widget.product.userId);
    if (mounted) {
      setState(() {
        _productOwner = _userProvider.user;
      });
    }
  }

  /// Toggle favorite status
  Future<void> _toggleFavorite() async {
    if (_userProvider.user == null) {
      debugPrint("User not logged in.");
      return;
    }

    List<String> favoriteIds = List.from(_userProvider.user!.favoriteIds ?? []);
    bool isFavorited = favoriteIds.contains(widget.product.id);

    setState(() {
      widget.product.isLike = !isFavorited;
    });

    if (isFavorited) {
      favoriteIds.remove(widget.product.id);
    } else {
      favoriteIds.add(widget.product.id);
    }

    // Update favoriteIds in the database
    await _userProvider.updateFavoriteIds(favoriteIds);
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    bool isFavorited =
        _userProvider.user?.favoriteIds.contains(widget.product.id) ?? false;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            onPressed: _toggleFavorite,
            icon: Icon(
              isFavorited ? Icons.favorite : Icons.favorite_border,
              color:
                  isFavorited
                      ? AppColors.redAccent(context)
                      : AppColors.textSecondary(context),
              size: AppSizes.iconSizeSmallValue,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingSmallValue,
            vertical: AppSizes.paddingSmallValue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppSizes.borderRadiusMediumValue,
                ),
                child: Center(
                  child: Image.network(
                    widget.product.imageUrl,
                    height: 250,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) =>
                            Icon(Icons.broken_image, size: 100),
                  ),
                ),
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

              CategoryButton(
                title:
                    categoryProvider.getCategoryName(
                      widget.product.categoryId,
                    ) ??
                    "Unknown",
                onTap: () {},
              ),

              SizedBox(height: AppSizes.paddingMediumValue),

              _productOwner != null
                  ? ProductOwnerContainer(user: _productOwner!)
                  : CircularProgressIndicator(),

              SizedBox(height: AppSizes.paddingMediumValue),

              // Ratings Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ratings",
                    style: AppTextStyles.largeSubHeading(context),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppSizes.borderRadiusLargeValue,
                      ),
                      border: Border.all(
                        color: AppColors.textSecondary(context),
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.paddingSmallValue,
                      vertical: 6,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          size: AppSizes.iconSizeSmallValue,
                          color: AppColors.accent(context),
                        ),
                        SizedBox(width: AppSizes.paddingXSmallValue),
                        Text(
                          widget.product.rating.toStringAsFixed(1),
                          style: AppTextStyles.subHeading(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSizes.paddingSmallValue),

              // Fetch and Display Reviews
              Consumer<ReviewProvider>(
                builder: (context, reviewProvider, child) {
                  List<ReviewModel> productReviews = reviewProvider
                      .getReviewsByProductId(widget.product.id);

                  if (reviewProvider.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return productReviews.isEmpty
                      ? Text(
                        "No reviews yet.",
                        style: AppTextStyles.body(context),
                      )
                      : Column(
                        children:
                            productReviews
                                .map(
                                  (review) => Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: AppSizes.paddingSmallValue,
                                    ),
                                    child: ReviewWidget(review: review),
                                  ),
                                )
                                .toList(),
                      );
                },
              ),
            ],
          ),
        ),
      ),

      // Bottom Bar with Price & Add to Cart
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${widget.product.price.toStringAsFixed(2)}",
              style: AppTextStyles.smallHeading(context).copyWith(
                color: AppColors.textPrimary(context),
                fontWeight: FontWeight.w700,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Add to cart", style: AppTextStyles.body(context)),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductOwnerContainer extends StatelessWidget {
  final UserModel user;

  const ProductOwnerContainer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusRoundValue),
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
                AppSizes.borderRadiusRoundValue,
              ),
              child: SizedBox(
                height: AppSizes.iconSizeLargeValue,
                width: AppSizes.iconSizeLargeValue,
                child: Image.network(
                  user.profileUrl.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: AppSizes.paddingSmallValue),
            Text(user.name, style: AppTextStyles.subHeading(context)),
            Spacer(),
            TextButton(
              onPressed: () async {},
              child: Text(
                "Chat",
                style: AppTextStyles.body(
                  context,
                ).copyWith(fontWeight: FontWeight.w800),
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
          ],
        ),
      ),
    );
  }
}
