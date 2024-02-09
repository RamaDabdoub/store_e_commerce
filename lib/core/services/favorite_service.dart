import 'package:empty_code/core/data/models/product_model.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:get/get.dart';


class FavoriteService{
  
  RxList<ProductModel> favoriteList = storage.getFavoriteList().obs;


  bool isFavorite(ProductModel model) {
    return favoriteList.contains(model);
  }


   void addToFavorite({required ProductModel model}){
    
     if (!isFavorite(model)) {
      favoriteList.add(model);
      
      storage.setFavoriteList(favoriteList);
    }
    print(favoriteList.length);
   }

   void removeFromFavoriteList(ProductModel model) {
    if (isFavorite(model)) {
      favoriteList.remove(model);
      storage.setFavoriteList(favoriteList);
    }
  }
  void clearFavorite() {
   
    favoriteList.clear();
    storage.setFavoriteList(favoriteList);
  }
}