import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/login_view/login_view.dart';
import 'package:empty_code/ui/views/sign_view/sign_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
    RxBool obscureText = true.obs;
  RxString passwordError = ''.obs;
  TextEditingController usernameController = TextEditingController(text: 'Rama');
  TextEditingController passwordController = TextEditingController(text: '20052005');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  String email = 'Malek@';
  String password = '20052005';


   void onInit() {
   
    super.onInit();
  }
  
   void Login() {
    Get.off(LoginView());
  }

  void SignFacebook() {
    Get.off(SignUpView());
  } 

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  SignUp() async {
    print('Username for login: ${usernameController.text}');
    print('Password for login: ${passwordController.text}');
    if (!isOnline) {
      BotToast.showText(text: 'Please check internet connection');
      return;
    }
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
     

     

       BotToast.showText(
  text: 'hh',
  duration: Duration(seconds: 3),
  contentPadding: EdgeInsets.all(15),
   textStyle: TextStyle(fontSize: 13.5,color: AppColors.whiteColor),
  contentColor: AppColors.navyColor,
);
isLoading.value = false;

    }
  }

}