import 'package:empty_code/core/translation/app_translation.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_button.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/landing_view/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  LandingController controller = Get.put(LandingController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/images/pngs/main_background.png',
              width: screenWidth(1),
              fit: BoxFit.fitWidth,
            ),
            Positioned(
              top: screenWidth(40),
              right: controller.selectedLanguage.value == 'ar'
                  ? screenWidth(1.3)
                  : 0,
              left: controller.selectedLanguage.value == 'en'
                  ? screenWidth(1.3)
                  : 0,
              child: Container(
                width: screenWidth(1),
                child: DropdownButton<String>(
                  icon: Icon(
                    Icons.language,
                    color: AppColors.skyblueColor,
                  ),
                  dropdownColor: Color.fromRGBO(151, 151, 151, 1).withOpacity(0.8),
                  underline: SizedBox(),
                  onChanged: (String? newValue) {
                    if (newValue == 'en') {
                      controller.changeLanguage('en');
                    } else if (newValue == 'ar') {
                      controller.changeLanguage('ar');
                    }
                  },
                  items: <String>['en', 'ar']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value == 'en' ? 'English' : 'العربية'),
                    );
                  }).toList(),
                ),
              ),
            ),
            Positioned(
                top: screenWidth(3),
                right: screenWidth(3.9),
                child: Image.asset('assets/images/pngs/logo.png',
                    width: screenWidth(1.8))),
            Positioned(
              bottom: screenWidth(6),
              right: screenWidth(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          controller.Login();
                        },
                        child: CustomButton(
                          text: tr('key_login'),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        controller.SignupView();
                      },
                      child: CustomButton(
                        text: tr('key_signup'),
                        color: [
                          AppColors.whiteColor,
                          AppColors.whiteColor,
                          AppColors.whiteColor
                        ],
                        textcolor: AppColors.blackColor,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
