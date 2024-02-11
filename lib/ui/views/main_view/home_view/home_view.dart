import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_product.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_shimmer.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/main_view/home_view/home_controller.dart';
import 'package:empty_code/ui/views/main_view/home_view/home_view_widget/categorie_widget.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());

  RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SmartRefresher(
          enablePullDown: true,
          controller: refreshController,
          header: WaterDropHeader(waterDropColor: AppColors.navyColor),
          onRefresh: ()  async {
                  await controller.refreshPage();
                  refreshController.refreshCompleted();
                },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: screenWidth(25),
                  end: screenWidth(25),
                  top: screenWidth(20),
                 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Customtext(
                    text: "Categories",
                    styleType: TextStyleType.TITLE,
                    textColor: AppColors.blackColor,
                  ),
                  SizedBox(height: screenWidth(29)),
                  Obx(
                    () => 
                    controller.is_loading.value 
                        ? CategoryShimmerLoading(shouldShowShimmer: true)
                        : !isOnline
                           ?Text('')
                         :
                          controller.categories.isEmpty
                            ?  Text('no category')
                            :
                             Container(
                                width: screenWidth(1),
                                height: screenWidth(9),
                                child: ListView.builder(
                                  itemCount: controller.categories.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Obx(() => CustomCategory(
                                        categoryName:
                                            controller.categories[index],
                                        backGroundColor:
                                            controller.selectedCategory.value ==
                                                    controller.categories[index]
                                                ? AppColors.navyColor
                                                : Colors.white,
                                        textColor:
                                            controller.selectedCategory.value ==
                                                    controller.categories[index]
                                                ? AppColors.whiteColor
                                                : AppColors.blackColor,
                                        ontap: () {
                                          controller.selectedCategory.value =
                                              controller.categories[index];
                                          controller.getProductByCategory();
                                          print(controller
                                              .selectedCategory.value);
                                        }));
                                  },
                                ),
                              ),
                  ),
                  SizedBox(height: screenWidth(29)),
                  Customtext(
                    text: "Products",
                    styleType: TextStyleType.TITLE,
                    textColor: AppColors.blackColor,
                  ),
                  SizedBox(height: screenWidth(29)),
                  Obx(
                    () => controller.is_loading.value
                          
                        ? ProductShimmerLoading()
                        : !isOnline
                           ?noInternet(() async {
                                await refreshController.requestRefresh();
                              })
                        : controller.categories.isEmpty
                            ? Text("No Products")
                            : Container(
                                width: screenWidth(1),
                                height: screenWidth(0.75),
                                child: GridView.builder(
                                  padding: EdgeInsets.all(screenWidth(40)),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: screenWidth(40),
                                          crossAxisSpacing: screenWidth(40),
                                          childAspectRatio: 0.69),
                                  itemCount: controller.products.length,
                                  itemBuilder: (context, index) {
                                    return CustomProduct(
                                        product: controller.products[index]);
                                  },
                                ),
                              ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
