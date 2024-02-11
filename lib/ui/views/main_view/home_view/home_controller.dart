import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/models/product_model.dart';
import 'package:empty_code/core/data/repositry/product_repositry.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_toast.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {


  bool showOption = false;
  RxBool is_loading = true.obs;
  RxList<String> categories = <String>[].obs;
  RxList<ProductModel> products = <ProductModel>[].obs;
  RxString selectedCategory = 'ALL'.obs;
  @override
  void onInit() async {
    if (!isOnline) {
      // CustomToast.showMeassge(message: "There is no intrent");
    } else {
      await getCategories();
      await getProductByCategory();
    }
     await Future.delayed(Duration(seconds: 3)); 
    is_loading.value = false;
    super.onInit();
  }

  refreshPage() async {
    if (isOnline) {
     
      is_loading.value = true;
      await getCategories();
      await getProductByCategory();
      is_loading.value = false;
      
    } else {
       is_loading.value = true;
      await Future.delayed(Duration(seconds: 2)); 
      is_loading.value = false;
      // CustomToast.showMeassge(message: "There is no intrent");
    }
  }


  getCategories() async {
    categories.clear();
    await ProductRepository().getAllCategory().then((value) {
      value.fold((l) {
        BotToast.showText(text: l);
      }, (r) {
        categories.add('ALL');
        categories.addAll(r);
       
           if (categories.isNotEmpty) {
        selectedCategory.value = categories[1];
      }
      });
    });
   
  }

  getProductByCategory() async {
    is_loading.value = true;
  if (selectedCategory.value == 'ALL') {
     products.clear();
    
   await  ProductRepository().getAllProduct().then((value) {
      value.fold((l) => BotToast.showText(text: l), (r) {
        products.addAll(r);
        
      });
    });
  } else {
     products.clear();
    await ProductRepository().getProductCategory(category: selectedCategory.value).then((value) {
      value.fold((l) => BotToast.showText(text: l), (r) {
        products.addAll(r);
       
      });
    });
  }
  is_loading.value = false;
}
  

}



