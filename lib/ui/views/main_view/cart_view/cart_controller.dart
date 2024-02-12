
import 'package:empty_code/core/data/models/cart_model.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:get/get.dart';


class CartController extends GetxController {
  List<CartModel> get cartList => cartserivce.cartList;

  @override
  void onInit() {
   
    super.onInit();
  }

  void removeFromCart(CartModel model) {
    cartserivce.removeFromCartList(model);
  }

  void changeCount(bool incress, CartModel model) {
    cartserivce.changeQty(
      incress: incress,
      model: model,
    );
  }
 

}
