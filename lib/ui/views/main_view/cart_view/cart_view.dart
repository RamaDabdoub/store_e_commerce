import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/shared_widget/cutsom_button.dart';
import 'package:empty_code/ui/shared/shared_widget/price_detail.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/checkout_view/checkout_view.dart';
import 'package:empty_code/ui/views/main_view/cart_view/cart_controller.dart';
import 'package:empty_code/ui/views/main_view/cart_view/cart_widget.dart';
import 'package:empty_code/ui/views/product_details_view/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatefulWidget {
 
  CartView({super.key,});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.grayColor,
      body: Obx(() => Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsetsDirectional.only(
                  start: screenWidth(25),
                  end: screenWidth(25),
                  top: screenWidth(20),
                 ),
                  children: [
                    Customtext(
                      text: 'Cart',
                      styleType: TextStyleType.TITLE,
                      textColor: AppColors.blackColor,
                    ),
                    SizedBox(height: screenWidth(20)),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.cartList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                         
                          child: CartWidget(
                                 onTap: ()async{
                            await  Get.to(ProductDetailsView(product: controller.cartList[index].productModel!))!.then((value) => cartserivce.cartList[index].qty.toString()); 
                          },           
                              index: index,
                              product: controller.cartList[index].productModel!),
                        );
                      },
                    ),
                    SizedBox(height: screenWidth(20)),
                    PriceDetail(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: screenWidth(20),
                    end: screenWidth(20),
                    bottom: screenWidth(60)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: "Placed Order",
                      onPressed: () {
                        Get.off(CheckOutView());
                      },
                    ),
                    SizedBox(height: screenWidth(40)),
                    InkWell(
                      onTap: () {
                        cartserivce.clearCart();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: AppColors.redColor, width: 1))),
                        child: Customtext(
                          text: "Empty Cart",
                          textColor: AppColors.redColor,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
