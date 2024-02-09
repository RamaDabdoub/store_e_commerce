import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/models/product_model.dart';
import 'package:empty_code/core/data/repositry/product_repositry.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_toast.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:get/get.dart';

class AllProductController extends GetxController {
  @override
  RxList<ProductModel> products = <ProductModel>[].obs;
  RxList<ProductModel> filtredProducts = <ProductModel>[].obs;
  RxBool is_loading = true.obs;
  DateTime? lastRefreshTime;
  void onInit() async {
    await getProducts();

    super.onInit();
  }

  getProducts() async {
    is_loading.value = true;
    if (isOnline) {
      await ProductRepository().getAllProduct().then((value) {
        value.fold((l) {
          BotToast.showText(text: l);
        }, (r) {
          products.addAll(r);
          filtredProducts.addAll(r);
        });
      });
    } else {
      CustomToast.showMeassge(message: "There is no intrent");
    }
    is_loading.value = false;
  }

  filter(String query) {
    if (query.isEmpty) {
      products.clear();
      getProducts();
    } else {
      filtredProducts.value = products
          .where((p0) => p0.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  Future<void> refreshPage() async {
    if (isOnline) {
      is_loading.value = true;
      await getProducts();
      is_loading.value = false;
    } else {
      is_loading.value = false;
      CustomToast.showMeassge(message: "There is no intrent");
    }
  }
}
