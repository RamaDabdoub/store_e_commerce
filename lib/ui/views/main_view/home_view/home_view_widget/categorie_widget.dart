import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';



class CustomCategory extends StatelessWidget {
  final String categoryName;
  final Color backGroundColor, textColor;
  final Function ontap;
  const CustomCategory(
      {super.key,
      required this.categoryName,
      required this.backGroundColor,
      required this.textColor,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          ontap();
        },
        child: Container(
            margin: EdgeInsetsDirectional.only(start: screenWidth(40)),
            constraints: BoxConstraints(
                maxWidth: screenWidth(2.3), minWidth: screenWidth(5)),
            decoration: BoxDecoration(
                color: backGroundColor,
                border: Border.all(
                    width: screenWidth(300), color: AppColors.graylightColor),
                borderRadius: BorderRadius.circular(screenWidth(30))),
            child: Center(
              child: Customtext(
                text: categoryName,
                textColor: textColor,
                styleType: TextStyleType.SUBTITLE,
              ),
            )));
  }
}
