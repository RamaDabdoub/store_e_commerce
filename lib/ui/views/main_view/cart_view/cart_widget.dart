import 'package:empty_code/core/data/models/product_model.dart';
import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/shared_widget/control_icons.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/main_view/cart_view/cart_controller.dart';
import 'package:empty_code/ui/views/product_details_view/product_details_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


class CartWidget extends StatefulWidget {
  final int index;
  final ProductModel product;
  final Function()? onTap;
  CartWidget({super.key, required this.index, required this.product, this.onTap});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  CartController controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Container(
        margin: EdgeInsets.only(bottom: screenWidth(50)),
        padding:EdgeInsetsDirectional.only(bottom: screenWidth(70),start:screenWidth(70),end:screenWidth(70)),
        width: screenWidth(1),
        height: screenWidth(2.65),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                width: screenWidth(200), color: AppColors.graylightColor)),
        child: Stack(
          
          children: [
            
            Row(
              children: [
                Image.network(
                  widget.product.image!,
                  width: screenWidth(4.2),
                  height: screenWidth(4.2),
                ),
                SizedBox(width: screenWidth(40)),
                Container(
                  width: screenWidth(1.64),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Customtext(
                        text: widget.product.title.toString(),
                        textColor: AppColors.blackColor,
                        styleType: TextStyleType.CUSTOM,
                        fontWeight: FontWeight.w500,
                        maxLines: 2,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Customtext(
                            text: "Price:",
                            styleType: TextStyleType.CUSTOM,
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth(25),
                            textColor: AppColors.navyColor,
                          ),
                          SizedBox(width: screenWidth(100)),
                          Customtext(
                            text: widget.product.price.toString(),
                            textColor: AppColors.blackColor,
                            styleType: TextStyleType.CUSTOM,
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Customtext(
                            text: "Total:",
                            styleType: TextStyleType.CUSTOM,
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth(25),
                            textColor: AppColors.navyColor,
                          ),
                          SizedBox(width: screenWidth(100)),
                          Customtext(
                            text: controller.cartList[widget.index].totals.toString(),
                            textColor: AppColors.blackColor,
                            styleType: TextStyleType.CUSTOM,
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              bottom: screenWidth(3.8),
              left: screenWidth(1.27),
              // alignment: Alignment.topRight,
              child: IconButton(
                  color: AppColors.redColor,
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    controller.removeFromCart(controller.cartList[widget.index]);
                  },
                  icon: Icon(
                    Icons.clear,
                    size: screenWidth(20),
                  )),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ControlIcons(
                index: widget.index,
              ),
            )
          ],
        ),
           ),
    );
  }
}
