import 'package:dots_indicator/dots_indicator.dart';
import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_dotindecator.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/intro_view/intro_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class IntroView extends StatelessWidget {
  final IntroController controller = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller.pageController, 
        itemCount: controller.images.length,
        onPageChanged: (index) => controller.updateIndex(index),
        itemBuilder: (context, index) {
          return buildIntroPage(controller, index);
        },
      ),
    );
  }

  Widget buildIntroPage(IntroController controller, int index) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: screenWidth(1),
                  height: screenWidth(5),
                  decoration: BoxDecoration(color: AppColors.lightblueColor),
                ),
              ),
              Positioned(
                top: screenWidth(5.5),
                child: Image.asset('assets/images/jpgs/umbrella.jpg'),
                width: screenWidth(1),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: screenWidth(10),
                  end: screenWidth(10),
                  top: screenWidth(1.4),
                ),
                child: Obx(
                  () {
                    return Text(
                      controller.descriptions[index],
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    );
                  },
                ),
              ),
              Positioned(
                top: screenWidth(1),
                child: Obx(() {
                  return Image.asset(
                    'assets/images/pngs/${controller.Images[index]}.png',
                    width: screenWidth(1),
                  );
                }),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: screenWidth(1),
                  height: screenWidth(1.7),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.lightblueColor,
                        AppColors.lightblueColor,
                        AppColors.skyblueColor,
                        AppColors.darkblueColor,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenWidth(0.9),
                right: screenWidth(4),
                child: Obx(
                  () {
                    return Image.asset(
                      'assets/images/pngs/${controller.images[index]}.png',
                      width: screenWidth(2),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: screenWidth(5),
                right: screenWidth(2.4),
                child: Obx(
                  () {
                    return CustomDotsDecorator(
                      totalDots: controller.images.length,
                      activeDotIndex: index,
                      dotColor: AppColors.whiteColor,
                      activeDotColor: AppColors.navyColor,
                      dotSize: 10,
                    );
                  },
                ),
              ),
              Positioned(
                bottom: screenWidth(5),
                left: screenWidth(1.3),
                child: Obx(
                  () => InkWell(
                      onTap: () {
                        controller.index.value < controller.images.length - 1
                            ? controller.NextView()
                            : controller.SkipView();
                      },
                      child:
                          controller.index.value < controller.images.length - 1
                              ? Customtext(text: 'Next')
                              : Customtext(text: 'Finish')
                              ),
                ),
              ),
              Positioned(
                bottom: screenWidth(5),
                right: screenWidth(1.3),
                child: InkWell(
                    onTap: () => controller.SkipView(),
                    child: Customtext(
                        text: "skip", styleType: TextStyleType.BODY)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
