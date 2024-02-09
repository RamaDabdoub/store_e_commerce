import 'package:empty_code/core/data/models/product_model.dart';
import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_rating.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/product_details_view/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomProduct extends StatelessWidget {
  final ProductModel product;
  CustomProduct({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailsView(product: product));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.graylightColor),
            borderRadius: BorderRadius.circular(15)),
        width: screenWidth(4),
        
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: screenWidth(28),
                  decoration: BoxDecoration(
                      color: AppColors.graylightColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: CustomStars(
                      rate: product.rating!.rate!, size: screenWidth(30)),
                )),
            Padding(
              padding: EdgeInsetsDirectional.only(top: screenWidth(15),start:screenWidth(40),end:screenWidth(40)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Image.network(
                      product.image!,
                      width: screenWidth(4),
                      height: screenWidth(4),
                    ),
                  ),
                  SizedBox(height: screenWidth(20)),
                  Customtext(
                    text: product.title!,
                    styleType: TextStyleType.CUSTOM,
                    textColor: AppColors.blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth(35),
                    maxLines: 3,
                    
                    
                  ),
                  SizedBox(height: screenWidth(30)),
                  Row(
                    children: [
                      Customtext(
                          text: "Price : ",
                          styleType: TextStyleType.SMALL,
                          fontWeight: FontWeight.bold,
                          textColor: AppColors.navyColor,),
                      Customtext(
                        text: product.price.toString(),
                        // text: '${controller.productList[index].price??""}',
                        styleType: TextStyleType.SMALL,
                        textColor: AppColors.blackColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
