import 'package:empty_code/ui/views/main_view/all_products_view/all_products_view.dart';
import 'package:empty_code/ui/views/main_view/cart_view/cart_view.dart';
import 'package:empty_code/ui/views/main_view/favorite_view/favorite_view.dart';
import 'package:empty_code/ui/views/main_view/home_view/home_view.dart';
import 'package:empty_code/ui/views/main_view/main_controller.dart';
import 'package:empty_code/ui/views/main_view/main_view_widgets/bottom_navigation_bar.dart';
import 'package:empty_code/ui/views/main_view/main_view_widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends StatefulWidget {
  const MainView({
    super.key,
  });

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  MainController maincontroller = Get.put(MainController());
  GlobalKey<ScaffoldState> scafolldKey = GlobalKey<ScaffoldState>();
  PageController controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
           key: scafolldKey,
        drawer: SideMenu(),
          bottomNavigationBar: CustomBottmNavigation(
            onTap: (selectedView, index) {
              maincontroller.selecte.value = selectedView;
              controller.jumpToPage(index);
            },
            selectedView: maincontroller.selecte.value,
          ),
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
              AllProductsView(),
              HomeView(),
              FavoriteView(),
              CartView()
            ],
          ),
        ),
      ),
    );
  }
}
