import 'package:bot_toast/bot_toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:empty_code/core/data/repositry/shared_prefrence_repositry.dart';
import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/core/services/cart_service.dart';
import 'package:empty_code/core/services/connectivity_service.dart';
import 'package:empty_code/core/services/favorite_service.dart';
import 'package:empty_code/core/services/location_service.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';


noInternet(Function() OnRefresh){
  return Padding(
    padding:  EdgeInsets.only(top:screenWidth(4),left: screenWidth(10),right: screenWidth(10)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/pngs/no_internet.png',width: screenWidth(3),height: screenWidth(3),color: AppColors.navyColor,),
        Container(
          margin: EdgeInsets.only(bottom: screenWidth(30)),
          child: Customtext(text: 'No Internet connection',styleType: TextStyleType.SUBTITLE,textColor: AppColors.blackColor,),
        ),
         Container(
          margin: EdgeInsets.only(bottom: screenWidth(20)),
          child: Customtext(text: 'Check Your connection, then refresh the page',textColor: AppColors.blackColor,),
        ),
        ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.navyColor)),
          onPressed: OnRefresh, child: Customtext(text: 'Refresh'))
      ],
    ),
  );
}



 customLoader() => BotToast.showCustomLoading(toastBuilder: (context) {
      return Container(
        decoration: BoxDecoration(
            color:Color.fromRGBO(4, 163, 232, 1).withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        width: screenWidth(4),
        height: screenWidth(4),
        child: SpinKitCircle(
          color:AppColors.graylightColor,
          size: screenWidth(8),
        ),
      );
    });


bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isComplexPassword(String password) {
  RegExp regex = RegExp(r'^.*(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#\$&*~]).*$'
      // r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$&*~]).{8,}$',
      );
  return regex.hasMatch(password);
}

bool isUsernameValid(String username) {
  // return RegExp(r"^[a-zA-Z]+$").hasMatch(username);
  return RegExp(r"^[a-zA-Z0-9_]+$").hasMatch(username);
}

double screenWidth(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.width / percent;
  else
    return Get.size.height / percent;
}

double screenHeight(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.height / percent;
  else
    return Get.size.width / percent;
}

SharedPrefrenceRepository get storage => Get.find<
    SharedPrefrenceRepository>(); // الفايند بتتعامل مع النوع فبقلا روحي جيبيلي هاد الاوبجيكت
ConnectivitySerivce get connectivitySerivce => Get.find<ConnectivitySerivce>();
Connectivity get connectivity => Get.find<Connectivity>();
CartService get cartserivce => Get.find<CartService>();
FavoriteService get favoriteservice => Get.find<FavoriteService>();
LocationService get locationService => Get.find<LocationService>();

bool isOnline = true;
