import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/app/my_app_controller.dart';
import 'package:empty_code/core/enums/connectivity_status.dart';
import 'package:empty_code/core/translation/app_translation.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/main_view/main_view.dart';
import 'package:empty_code/ui/views/splash_view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyAppController controller = Get.put(MyAppController());

    return StreamProvider<ConnectivityStatus>(
        create: (context) =>
            connectivitySerivce.connectivityStatusController.stream,
        initialData: ConnectivityStatus.OFFLINE,
        child: GetMaterialApp(
            locale: getLocal(),
            translations: AppTranslation(),
            debugShowCheckedModeBanner: false,
            builder: BotToastInit(),
            navigatorObservers: [BotToastNavigatorObserver()],
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: 'Cairo',
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: AppColors.grayColor,
              ),
            ),
            home: SplashView()));
  }
}

Locale getLocal() {
  String langCode = storage.getAppLanguage();

  if (langCode == 'ar')
    return Locale('ar', 'SA');
  else if (langCode == 'en')
    return Locale('en', 'US');
  else
    return Locale('fr', 'FR');
}
