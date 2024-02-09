import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_product.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_shimmer.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/main_view/all_products_view/all_products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AllProductsView extends StatefulWidget {
  AllProductsView({super.key});

  @override
  State<AllProductsView> createState() => _AllProductsViewState();
}

class _AllProductsViewState extends State<AllProductsView> {
  AllProductController controller = Get.put(AllProductController());

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

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
          child: ListView(      
                 padding: EdgeInsetsDirectional.only(
                    start: screenWidth(25),
                    end: screenWidth(25),
                    top: screenWidth(20),
                   ),
            children: [
              Customtext(
                  text: "All Products",
                  styleType: TextStyleType.TITLE,
                  textColor: AppColors.blackColor),
              SizedBox(height: screenWidth(20)),
              Container(
                width: screenWidth(1.1),
                height: screenWidth(7.6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: AppColors.graydarkColor)),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: screenWidth(25)),
                      hintText: "Serach...",
                      hintStyle: TextStyle(color: AppColors.graylightColor),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        size: screenWidth(15),
                        
                      )),
                 
                  onChanged: (value) {
                    controller.filter(value);
                  },
                ),
              ),
              SizedBox(height: screenWidth(24)),
              Obx(
                () => controller.is_loading.value
                    ? ProductShimmerLoading()
                    : Container(
                        width: screenWidth(1),
                        height: screenWidth(0.7),
                        child: GridView.builder(
                          padding: EdgeInsets.all(screenWidth(40)),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: screenWidth(40),
                                  crossAxisSpacing: screenWidth(40),
                                  childAspectRatio: 0.71),
                          itemCount: controller.filtredProducts.length,
                          itemBuilder: (context, index) {
                            return CustomProduct(
                                product: controller.filtredProducts[index]);
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
