import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/models/remmber_me.dart';
import 'package:empty_code/core/data/repositry/auth_repository.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/main_view/main_view.dart';
import 'package:empty_code/ui/views/sign_view/sign_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {
  RxString passwordError = ''.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  RxBool isChecked = false.obs;
  void onInit() {
    if (storage.getLoginInfo().rememberme ?? false) {
      isChecked = true.obs;
      print('Username from storage: ${storage.getLoginInfo().username}');
      print('Password from storage: ${storage.getLoginInfo().password}');
      usernameController.text = storage.getLoginInfo().username ?? '';
      passwordController.text = storage.getLoginInfo().password ?? '';
    }
    super.onInit();
  }

  void SignUp() {
    Get.off(SignUpView());
  }

  void LogFacebook() {
    Get.off(SignUpView());
  }

   Login() async {
    print('Username for login: ${usernameController.text}');
    print('Password for login: ${passwordController.text}');
    if (!isOnline) {
      BotToast.showText(text: 'Please check internet connection');
      return;
    }
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      if (isChecked.value) {
        storage.setLoginInfo(RememberMe(
            username: usernameController.text,
            password: passwordController.text,
            rememberme: true));
      }

      await AuthRepository()
          .login(
              username: usernameController.text,
              password: passwordController.text)
          .then((value) {
       
        print(value);
      
        value.fold((l) {
          isLoading.value = false;
          print('object');
          BotToast.showText(text: l);
          isLoading.value = false;
        }, (r) {
          storage.setTokenInfo(r);

          Get.offAll(MainView());
          //  isLoading.value = false;
        });
      });
     
    }
  }
}
