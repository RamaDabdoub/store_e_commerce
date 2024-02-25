import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/landing_view/landing_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class IntroController extends GetxController {
  final PageController pageController = PageController();
  List<String> descriptions = [
    'Life is a succession of lessons which must be lived to be understood.',
    'You come into the world with nothing, and the purpose of your life is to make something out of nothing.',
    ' Life is what happens while you are busy making other plans.'
  ].obs;
   List<String> images = ['bag', 'mobile', 'truck'].obs;
  List<String> Images = ['city', 'world', 'city'].obs;

  RxInt index = 0.obs;
  void onInit() {
    storage.setFirstLunch(false);
    super.onInit();
  }
   void updateIndex(int newIndex) {
    index.value = newIndex;
  }

   void NextView() {
    if (index < images.length - 1) {
      index++;
      pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      Get.off(LandingView());
    }
  }
  void SkipView(){
     Get.off(LandingView());
  }
}
 