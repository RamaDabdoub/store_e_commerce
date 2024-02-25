import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/intro_view/intro_view.dart';
import 'package:empty_code/ui/views/landing_view/landing_view.dart';
import 'package:empty_code/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      Get.off(storage.getFirstLunch()
          ? IntroView()
          : storage.getLoggedIn()
              ? MainView()
              : LandingView());
    });

    super.onInit();
  }
}
