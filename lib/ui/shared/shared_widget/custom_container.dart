
import 'package:empty_code/ui/shared/colors.dart';
import 'package:flutter/material.dart';


class CustomContainerSign extends StatelessWidget {
  final String text;
  const CustomContainerSign({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 1.1,
      height: size.width / 6,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: AppColors.blueColor),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            top: size.width / 18,
            start: size.width / 20,
            bottom: size.width / 20),
        child: Text(
          text,
          style: TextStyle(
            fontSize: size.width / 28,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
