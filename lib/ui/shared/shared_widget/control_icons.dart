import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/main_view/cart_view/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ControlIcons extends StatelessWidget {
  final int index;
  CartController controller = Get.find<CartController>();
  ControlIcons({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomIcon(
          width: screenWidth(16),
          height: screenWidth(16),
          icon: Icons.remove,
          onPressed: () {
            controller.changeCount(false, controller.cartList[index]);
          },
        ),
        SizedBox(width: screenWidth(80)),
        Obx(() => Customtext(
              text: controller.cartList[index].qty.toString(),
              textColor: AppColors.blackColor,
              styleType: TextStyleType.CUSTOM,
              fontSize: screenWidth(17),
              fontWeight: FontWeight.w500,
            )),
        SizedBox(width: screenWidth(80)),
        CustomIcon(
           width: screenWidth(16),
          height: screenWidth(16),
          icon: Icons.add,
          onPressed: () {
            controller.changeCount(true, controller.cartList[index]);
          },
        )
      ],
    );
  }
}

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final double? width;
  final double? height;
 
  const CustomIcon({super.key, required this.icon, required this.onPressed, this.width, this.height, });

  @override
  Widget build(BuildContext context) {
    return Container(
        width:width?? screenWidth(12),
        height:height?? screenWidth(12),
        decoration: BoxDecoration(
          color: AppColors.navyColor,
          border:
              Border.all(width: screenWidth(200), color: AppColors.navyColor),
          shape: BoxShape.circle,
          //   color: AppColors.primaryColor
        ),
        child: Center(
          child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                onPressed();
              },
              icon: Icon(
                icon,
                color: AppColors.whiteColor,
                size: screenWidth(20),
              )),
        ));
  }
}
