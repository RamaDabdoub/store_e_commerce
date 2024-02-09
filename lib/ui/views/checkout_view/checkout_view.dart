import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_row.dart';
import 'package:empty_code/ui/shared/shared_widget/cutsom_button.dart';
import 'package:empty_code/ui/shared/shared_widget/price_detail.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/checkout_view/checkout_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


class CheckOutView extends StatefulWidget {
  CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  CheckoutController controller = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomButton(
          text: 'Continue Shopping',
          onPressed: () {
            controller.onPlacedOrder();
          },
        ),
        
        body: Padding(
          padding: EdgeInsetsDirectional.only(
                  start: screenWidth(25),
                  end: screenWidth(25),
                  top: screenWidth(20),
                 ),
          child: ListView(
            children: [
              Customtext(
                text:'Your order placed successfully',
                styleType: TextStyleType.TITLE,
                textColor: AppColors.blackColor,
                maxLines: 100,
              ),
             SizedBox(height: screenWidth(15),),
             CustomRowText(textone: 'Order NO:', texttwo: '#123910',fontSize: screenWidth(22),),
             SizedBox(height: screenWidth(22),),
             CustomRowText(textone: 'Items Count:', texttwo: cartserivce.cartList.length.toString(),fontSize: screenWidth(22),),
             SizedBox(height: screenWidth(8),),
              PriceDetail(),
            ],
          ),
        ),
      ),
    );
  }
}
