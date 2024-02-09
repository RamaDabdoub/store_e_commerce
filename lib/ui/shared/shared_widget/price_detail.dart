import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';



class PriceDetail extends StatelessWidget {
  const PriceDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: screenWidth(60),
          thickness: screenWidth(170),
          color: AppColors.navyColor,
        ),
        ListTile(
          leading: Customtext(
            text: "Sub Total:",
            textColor: AppColors.navyColor,
            styleType: TextStyleType.CUSTOM,
            fontSize: screenWidth(23),
            fontWeight: FontWeight.w500,
          ),
          trailing: Customtext(
            text: cartserivce.subTotal.toString()+' '+'SP',
            textColor: AppColors.blackColor,
            styleType: TextStyleType.CUSTOM,
            fontSize: screenWidth(25),
            fontWeight: FontWeight.w500,
          ),
        ),
        Divider(
          height: screenWidth(400),
          indent: screenWidth(20),
          endIndent: screenWidth(20),
          thickness: screenWidth(300),
          color: AppColors.navyColor,
        ),
        ListTile(
          leading: Customtext(
            text: "Tax:",
            
             textColor: AppColors.navyColor,
            styleType: TextStyleType.CUSTOM,
            fontSize: screenWidth(23),
            fontWeight: FontWeight.w500,
          ),
          trailing: Customtext(
            text: cartserivce.taxAmount.toString()+' '+'SP',
            textColor: AppColors.blackColor,
            styleType: TextStyleType.CUSTOM,
            fontSize: screenWidth(25),
            fontWeight: FontWeight.w500,
          ),
        ),
        Divider(
          height: screenWidth(400),
          indent: screenWidth(20),
          endIndent: screenWidth(20),
          thickness: screenWidth(300),
          color: AppColors.navyColor,
        ),
        ListTile(
          leading: Customtext(
            text: "Delivery Fees:",
             textColor: AppColors.navyColor,
            styleType: TextStyleType.CUSTOM,
            fontSize: screenWidth(23),
            fontWeight: FontWeight.w500,
          ),
          trailing: Customtext(
            text: cartserivce.deliveryFees.toString()+' '+'SP',
             textColor: AppColors.blackColor,
            styleType: TextStyleType.CUSTOM,
            fontSize: screenWidth(26),
            fontWeight: FontWeight.w500,
          ),
        ),
        Divider(
          height: screenWidth(400),
          indent: screenWidth(20),
          endIndent: screenWidth(20),
          thickness: screenWidth(300),
          color: AppColors.navyColor,
        ),
        ListTile(
          leading: Customtext(
            text: "Total:",
             textColor: AppColors.redColor,
            styleType: TextStyleType.CUSTOM,
            fontSize: screenWidth(23),
            fontWeight: FontWeight.w500,
          ),
          trailing: Customtext(
            text: cartserivce.total.toString()+' '+'SP',
             textColor: AppColors.blackColor,
            styleType: TextStyleType.CUSTOM,
            fontSize: screenWidth(25),
            fontWeight: FontWeight.w500,
          ),
        ),
        Divider(
          thickness: screenWidth(170),
          color: AppColors.navyColor,
        ),
      ],
    );
  }
}
