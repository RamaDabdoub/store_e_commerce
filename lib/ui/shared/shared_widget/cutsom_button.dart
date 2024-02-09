import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';



class CustomButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  
  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(1.1),
      height: screenWidth(8),
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: AppColors.navyColor))),
              backgroundColor: MaterialStatePropertyAll(AppColors.navyColor)),
          onPressed: () {
            onPressed!();
          },
          child: Customtext(
            text: text,
            styleType: TextStyleType.CUSTOM,
            fontSize: screenWidth(16),
            fontWeight: FontWeight.w400,
            
          )),
    );
  }
}

