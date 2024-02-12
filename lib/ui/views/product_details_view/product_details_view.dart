import 'package:empty_code/core/data/models/product_model.dart';
import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/shared_widget/control_icons.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_rating.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_row.dart';
import 'package:empty_code/ui/shared/shared_widget/cutsom_button.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/product_details_view/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductDetailsView extends StatefulWidget {
  final ProductModel product;
  const ProductDetailsView({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductDetailsView> {
  ProductController controller = Get.put(ProductController());
   void updateCartWithQuantity(int newQuantity) {
    Get.back(result: newQuantity);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsetsDirectional.only(
                  start: screenWidth(25),
                  end: screenWidth(25),
                  top: screenWidth(20),
                 ),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Customtext(
                          text: widget.product.title.toString(),
                          textColor: AppColors.blackColor,
                          styleType: TextStyleType.SUBTITLE,
                          overFlow: TextOverflow.visible,
                          softWrap: true,
                          maxLines: 100,
                        ),
                      ),
                      Obx(
                        () => Padding(
                          padding: EdgeInsetsDirectional.only(
                              bottom: screenWidth(20)),
                          child: IconButton(
                            color: AppColors.redColor,
                            icon: favoriteservice.isFavorite(widget.product)
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border),
                            onPressed: () {
                              if (favoriteservice.isFavorite(widget.product)) {
                                favoriteservice
                                    .removeFromFavoriteList(widget.product);
                                    
                              } else {
                                favoriteservice.addToFavorite(
                                    model: widget.product);
                              }
                            },
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth(20)),
                  Center(
                    child: Image.network(
                      widget.product.image!,
                      width: screenWidth(1.7),
                    ),
                  ),
                  SizedBox(height: screenWidth(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Customtext(
                        text: 'Description:',
                        textColor: AppColors.navyColor,
                        styleType: TextStyleType.CUSTOM,
                        fontSize: screenWidth(18),
                        fontWeight: FontWeight.w500,
                      ),
                      CustomStars(
                        rate: widget.product.rating!.rate!,
                        size: screenWidth(24),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth(40)),
                  Customtext(
                    textColor: AppColors.blackColor,
                    styleType: TextStyleType.CUSTOM,
                    fontSize: screenWidth(23),
                    fontWeight: FontWeight.w400,
                    text: widget.product.description!,
                    maxLines: 100,
                    
                    
                  ),
                  SizedBox(height: screenWidth(13)),
                  CustomRowText(
                      textone: 'Category :',
                      texttwo: widget.product.category.toString()),
                  SizedBox(height: screenWidth(20)),
                  CustomRowText(
                      textone: 'Price:',
                      texttwo: widget.product.price.toString() + r"$"),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              height: screenWidth(3.6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: AppColors.whiteColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: CustomButton(
                      text: "Add to cart",
                      onPressed: () {
                        cartserivce.addToCart(
                            model: widget.product, qty: controller.count.value);
                          updateCartWithQuantity(controller.count.value);
                      },
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomIcon(
                        icon: Icons.remove,
                        onPressed: () {
                          controller.count.value--;
                        },
                      ),
                      SizedBox(width: screenWidth(40)),
                      Obx(() => Customtext(
                            text: controller.count.value.toString(),
                            textColor: AppColors.blackColor,
                            styleType: TextStyleType.CUSTOM,
                            fontSize: screenWidth(15),
                            fontWeight: FontWeight.w500,
                          )),
                      SizedBox(width: screenWidth(40)),
                      CustomIcon(
                        icon: Icons.add,
                        onPressed: () {
                          controller.count.value++;
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
