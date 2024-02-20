import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SideItem extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool? needClose;
  final String svgIcName;

  final double? w;
  const SideItem(
      {super.key,
      required this.title,
      this.needClose = false,
      required this.onTap,
      required this.svgIcName,
      this.w});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onTap();
          if (needClose!) Get.back();
        },
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: SvgPicture.asset(
                  'assets/images/svgs/$svgIcName.svg',
                  width: w ?? screenWidth(12),
                )),
            Expanded(
                flex: 3,
                child: Customtext(
                  text: title,
                 styleType: TextStyleType.BODY,
                  textColor: AppColors.blackColor,
                )),
          ],
        ));
  }
}
