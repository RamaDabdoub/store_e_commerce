import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final List<Color>? color;
  final Color? textcolor;

  const CustomButton({
    super.key,
    required this.text,
    this.color,
    this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(1.1),
      height: screenWidth(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(
          colors: color ??
              [
                AppColors.lightblueColor,
                AppColors.lightblueColor,
                AppColors.darkblueColor
              ],
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: screenWidth(22),
              color: textcolor ?? AppColors.offwhiteColor),
        ),
      ),
    );
  }
}
