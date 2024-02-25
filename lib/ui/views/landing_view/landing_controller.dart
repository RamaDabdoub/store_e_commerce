import 'package:empty_code/app/my_app.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/login_view/login_view.dart';
import 'package:empty_code/ui/views/sign_view/sign_view.dart';
import 'package:get/get.dart';


class LandingController extends GetxController {
 
   RxString selectedLanguage = 'en'.obs; 
   void Login(){
    Get.off(LoginView());
  }
   void SignupView(){
    Get.off(SignUpView());
  }
  
  void changeLanguage(String code) {
    storage.setAppLanguage(code);
    selectedLanguage.value = code; 
    Get.updateLocale(getLocal());
  }
  
}