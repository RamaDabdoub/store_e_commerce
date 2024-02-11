import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/enums/message_type.dart';
import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';



class CustomToast {
  static showMeassge({
    required String message,
    MessageType messageType = MessageType.INFO,
  }) {
    String imageName = 'info';
    Color shadowColor = AppColors.navyColor;

    switch (messageType) {
      case MessageType.INFO:
        imageName = 'info';
        //    shadowColor = AppColors.blueColor;
        break;
      case MessageType.WARNING:
        imageName = 'warning';
        //  shadowColor = AppColors.redColor;
        break;
      case MessageType.REJECTED:
        imageName = 'rejected-01';
        //shadowColor = AppColors.redColor;
        break;
      case MessageType.SUCCSESS:
        imageName = 'approved1-01';
        //shadowColor = AppColors.grayColor;
        break;
    }

    BotToast.showCustomText(
        duration: Duration(seconds: 3),
        toastBuilder: (value) {
          return Container(
            padding: EdgeInsets.all(screenWidth(40)),
            width: screenWidth(2.3),
            height: screenWidth(5),
            decoration: BoxDecoration(
                //      color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Center(
              child: Customtext(
                text: message,
                styleType: TextStyleType.SUBTITLE,
                maxLines: 2,
              ),
            ),
          );
        });
  }
}
