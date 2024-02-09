
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';


class CheckoutController extends GetxController {
   @override
  void onInit() {
    super.onInit();
  }

  onPlacedOrder() {
    cartserivce.clearCart();
    Get.off(() => MainView());
  }
}
