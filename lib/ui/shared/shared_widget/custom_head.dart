import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';



class Header extends StatelessWidget {
  final Function? onRefresh;
  const Header({super.key, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsetsDirectional.only(
                end: screenWidth(20),
                bottom: screenWidth(20),
                top: screenWidth(35)),
            width: screenWidth(6),
            height: screenWidth(6),
            decoration: BoxDecoration(
                border: Border.all(
                    width: screenWidth(250), color: AppColors.blueColor),
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/pngs/logo.png",
                  ),
                ))),
        Customtext(
          text: "Cris Store",
          styleType: TextStyleType.TITLE,
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  width: screenWidth(200), color: AppColors.graylightColor),
              color: AppColors.graylightColor,
              borderRadius: BorderRadius.circular(30)),
          child: IconButton(
              onPressed: () {
                onRefresh!();
              },
              icon: Icon(Icons.refresh)),
        ),
      ],
    );
  }
}
