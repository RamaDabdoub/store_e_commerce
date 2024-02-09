import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';


class CustomRowText extends StatelessWidget {
  final String textone;
  final String texttwo;
  final double? fontSize;
  const CustomRowText({super.key, required this.textone, required this.texttwo, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Customtext(text: textone,textColor:AppColors.navyColor,styleType: TextStyleType.CUSTOM,fontSize:fontSize?? screenWidth(18),fontWeight: FontWeight.w500,),
        SizedBox(width: screenWidth(40),),
        Customtext(text: texttwo,textColor:AppColors.blackColor,fontWeight: FontWeight.w500,),

       
      ],
    );
  }
}