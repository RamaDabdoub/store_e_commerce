import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/models/remmber_me.dart';
import 'package:empty_code/core/data/repositry/auth_repository.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/login_view/login_view.dart';
import 'package:empty_code/ui/views/main_view/main_view.dart';
import 'package:empty_code/ui/views/sign_view/sign_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
   RxBool obscureText = true.obs;
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
    Get.off(LoginView());
  }
 void toggleObscureText() {
    obscureText.value = !obscureText.value;
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
          print('object');
          isLoading.value = false;
          print(isLoading.value);

       BotToast.showText(
  text: l,
  duration: Duration(seconds: 3),
  contentPadding: EdgeInsets.all(15),
   textStyle: TextStyle(fontSize: 13.5,color: AppColors.whiteColor),
  contentColor: AppColors.navyColor,
);


        }, (r) {
          storage.setTokenInfo(r);
          storage.setLoggedIn(true);
          isLoading.value = false;
          Get.offAll(MainView());
        });
      });
    }
  }
}
