import 'package:empty_code/core/data/models/product_model.dart';
import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/product_details_view/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FavoriteWidget extends StatelessWidget {
  final int index;
  final ProductModel product;
  const FavoriteWidget({Key? key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ProductDetailsView(product: product));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: screenWidth(50)),
        padding: EdgeInsetsDirectional.only(
          bottom: screenWidth(70),
          start: screenWidth(70),
        ),
        width: screenWidth(1),
        height: screenWidth(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: screenWidth(200), color: AppColors.graylightColor),
        ),
        child: Stack(
          children: [
            Positioned(
              top: screenWidth(20),
              child: Image.network(
                product.image!,
                width: screenWidth(4.2),
                height: screenWidth(4.2),
              ),
            ),
            Positioned(
              top: screenWidth(13),
              right: screenWidth(10),
              child: Container(
                width: screenWidth(1.9),
                child: Customtext(
                  text: product.title.toString(),
                  textColor: AppColors.blackColor,
                  styleType: TextStyleType.CUSTOM,
                  fontWeight: FontWeight.w500,
                  softWrap: true,
                  maxLines: 100, // هنا يمكنك تحديد عدد الأسطر المراد عرضها
                ),
              ),
            ),
            Positioned(
              top: screenWidth(11),
              right: screenWidth(150),
              child: IconButton(
                color: AppColors.redColor,
                icon: favoriteservice.isFavorite(product)
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                onPressed: () {
                  if (favoriteservice.isFavorite(product)) {
                    favoriteservice.removeFromFavoriteList(product);
                  } else {
                    favoriteservice.addToFavorite(model: product);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
