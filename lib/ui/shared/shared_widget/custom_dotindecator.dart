import 'package:empty_code/ui/shared/colors.dart';
import 'package:flutter/material.dart';


class CustomDotsDecorator extends StatelessWidget {
  final int totalDots;
  final int activeDotIndex;
  final Color dotColor;
  final Color activeDotColor;
  final double dotSize;

  CustomDotsDecorator({
    required this.totalDots,
    required this.activeDotIndex,
    this.dotColor = Colors.white,
    this.dotSize = 10.0, required this.activeDotColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalDots, (index) {
        final isActive = index == activeDotIndex;
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          width: dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? activeDotColor : dotColor,
            border: isActive
                ?  Border.all(color: AppColors.whiteColor, width: 1.5)
                : Border.all(color: dotColor, width: 1.0),
          ),
        );
      }),
    );
  }
}
