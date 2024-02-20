
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class CheckoutController extends GetxController {
   Rx<LatLng?> selectedLocation = Rx<LatLng?>(null);

  void updateSelectedLocation(LatLng location) {
    selectedLocation.value = location;
  }
   @override
  void onInit() {
    super.onInit();
  }

  onPlacedOrder() {
    cartserivce.clearCart();
    Get.off(() => MainView());
  }
}
