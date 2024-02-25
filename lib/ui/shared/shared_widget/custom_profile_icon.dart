import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';



class CustomProfileIcon extends StatelessWidget {
  final double? widthimg;
  final double hw;
  final String? urlOfImg;
  final String? assetImg;
  final Color? backgroundColor;
  final List<Color>? gradientColor;
  const CustomProfileIcon(
      {super.key,
      required this.hw,
      this.urlOfImg,
      this.assetImg,
      this.backgroundColor,
      this.gradientColor = AppColors.gradientColor, this.widthimg});

  @override
  Widget build(BuildContext context) {
    
    if (assetImg != null && urlOfImg == null) {
      return Container(
        width: screenWidth(hw),
        height: screenWidth(hw),
        decoration: BoxDecoration(        
          border: Border.all(
            width: screenWidth(300),
            color: AppColors.skyblueColor,
          ),
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(assetImg!),
          ),
        ),
        child: Image.asset('assets/images/pngs/ic_profile.png'),
      );
    } else if (assetImg == null && urlOfImg != null) {
      return Container(
        width: screenWidth(hw),
        height: screenWidth(hw),
        decoration: BoxDecoration(
          border: Border.all(
            width: screenWidth(500),
            color: AppColors.orangeColor,
          ),
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(urlOfImg!),
          ),
        ),
      );
    } else {
      return Container(
        width: screenWidth(hw),
        height: screenWidth(hw),
        decoration: BoxDecoration(
          color: backgroundColor,
          gradient: backgroundColor != null
              ? null
              : LinearGradient(
                  begin: AlignmentDirectional.bottomCenter,
                  end: AlignmentDirectional.topCenter,
                  colors: gradientColor!),
          borderRadius: BorderRadius.circular(100),
        ),
      );
    }
  }
}
