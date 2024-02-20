import 'package:empty_code/core/translation/app_translation.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_button.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/landing_view/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_svg/svg.dart';

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
              top: screenWidth(30),
              right: screenWidth(14),
              child: InkWell(
                onTap: () {
                  Get.bottomSheet(
                    backgroundColor:Color.fromARGB(255, 197, 239, 255),
                    Container(
                      decoration: BoxDecoration( 
                          
                        borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),),
                   
                      height: screenWidth(3),
                      child: Padding(
                        padding:  EdgeInsets.only(top:screenWidth(20),right: screenWidth(15)),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListTile(
                                hoverColor: AppColors.graylightColor,
                                title: Text('English'),
                                onTap: () {
                                  controller.changeLanguage('en');
                                  Get.back();
                                },
                              ),
                            ),
                             Divider(
          height: screenWidth(300),
          indent: screenWidth(30),
          endIndent: screenWidth(15),
          thickness: screenWidth(300),
          color: AppColors.navyColor,
        ),
                            Expanded(
                              child: ListTile(
                                title: Text('العربية'),
                                onTap: () {
                                  controller.changeLanguage('ar');
                                  Get.back();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: SvgPicture.asset(
                  'assets/images/svgs/earth-globe.svg',
                  colorFilter: ColorFilter.mode(
                    AppColors.skyblueColor,
                    BlendMode.srcIn,
                  ),
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
