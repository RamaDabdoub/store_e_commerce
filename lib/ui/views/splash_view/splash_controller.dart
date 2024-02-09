import 'package:empty_code/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      Get.off(MainView());
    });

    super.onInit();
  }
}
