import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_profile_icon.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/landing_view/landing_view.dart';
import 'package:empty_code/ui/views/main_view/favorite_view/favorite_view.dart';
import 'package:empty_code/ui/views/main_view/home_view/home_view.dart';
import 'package:empty_code/ui/views/main_view/main_view.dart';
import 'package:empty_code/ui/views/main_view/main_view_widgets/side_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

class ProfileController extends GetxController {
  Rx<File?> selectedImage = Rx<File?>(null);

  void setImage(File? image) {
    selectedImage.value = image;
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setImage(File(pickedImage.path));
    }
  }
}

class SideMenu extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    void _showImageOptions() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: Customtext(
                  text: 'Take a Picture',
                  textColor: AppColors.blackColor,
                ),
                onTap: () {
                  Get.back();
                  profileController.pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Customtext(
                  text: 'Choose from Gallery',
                  textColor: AppColors.blackColor,
                ),
                onTap: () {
                  // Navigator.pop(context);
                  Get.back();
                  profileController.pickImage(ImageSource.gallery);
                },
              ),
            ],
          );
        },
      );
    }

    return Obx(() => Container(
        width: screenWidth(1.2),
        color: Colors.white.withOpacity(0.9),
        child: Column(children: [
          SizedBox(height: screenWidth(10)),
          Center(
            child: InkWell(
              onTap: () {
                _showImageOptions();
              },
              child: Container(
                width: screenWidth(2.4),
                child: Stack(
                  children: [
                    Positioned(
                      right: screenWidth(80),
                      top: screenWidth(45),
                      child: CustomProfileIcon(
                        hw: 8,
                        backgroundColor: AppColors.graylightColor,
                      ),
                    ),
                    Positioned(
                        bottom: screenWidth(30),
                        left: screenWidth(23),
                        child: CustomProfileIcon(hw: 18)),
                    Center(
                      child: CircleAvatar(
                        radius: screenWidth(6),
                        backgroundImage: profileController
                                    .selectedImage.value !=
                                null
                            ? FileImage(profileController.selectedImage.value!)
                            : null,
                        child: profileController.selectedImage.value == null
                            ? Center(
                                child: CustomProfileIcon(
                                  hw: 3,
                                  assetImg: 'assets/images/pngs/ic_profile.png',
                                ),
                              )
                            : null,
                      ),
                    ),
                    Positioned(
                        top: screenWidth(35),
                        left: screenWidth(15),
                        child: CustomProfileIcon(hw: 30)),
                    Positioned(
                        left: screenWidth(2.79),
                        top: screenWidth(8.8),
                        child: CustomProfileIcon(
                          hw: 17,
                        )),
                  ],
                ),
              ),
            ),
          ),
          Center(
              child: Padding(
            padding: EdgeInsetsDirectional.only(
                top: screenWidth(35), bottom: screenWidth(10)),
            child: Column(
              children: [
                Customtext(
                  text: 'Rama Dabdoub',
                  styleType: TextStyleType.BODY,
                  textColor: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                ),
                Customtext(
                  text: 'Rama@gmail.com',
                  styleType: TextStyleType.BODY,
                  textColor: AppColors.blackColor,
                  
                )
              ],
            ),
          )),
          Container(
            width: screenWidth(1),
            height: screenWidth(1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SideItem(svgIcName: 'ic_home', title: 'Home', onTap: () {
                  Get.off(MainView());
                }),
                SideItem(
                    svgIcName: 'ic_categories',
                    title: 'Categories',
                    onTap: () {
                      Get.off(HomeView());
                    }),
                SideItem(
                    svgIcName: 'ic_orders', title: 'My orders', onTap: () {}),
                SideItem(
                    svgIcName: 'ic_heart', title: 'Wish list', onTap: () {
                      Get.off(MainView(), arguments: 'favorite');
                    }),
                SideItem(
                    svgIcName: 'ic_settings', title: 'Settings', onTap: () {}),
                SideItem(
                    svgIcName: 'ic_bell', title: 'Notifications', onTap: () {}),
                SideItem(
                    svgIcName: 'ic_faq',
                    title: 'Help & FAQ',
                    needClose: true,
                    onTap: () {}),
                SideItem(
                    svgIcName: 'ic_logout',
                    title: 'Logout',
                    w: screenWidth(14),
                    onTap: () {
                      Get.defaultDialog(
                        title: "Are you sure to log out?",
                         titleStyle: TextStyle(fontSize: screenWidth(20)),
                        titlePadding: EdgeInsets.only(top: screenWidth(30)),
                        contentPadding: EdgeInsets.only(bottom: screenWidth(30)),
                        content:Container() ,
                        textCancel: "Cancel",
                        textConfirm: "log out",
                        confirmTextColor: AppColors.whiteColor,
                        buttonColor:AppColors.navyColor,                       
                        onCancel: () {
                          print("Dialog is cancelled");
                        },
                        onConfirm: () {
                          print("Dialog is confirmed");
                           storage.setLoggedIn(false);
                      Get.off(LandingView());
                        },
                      );
                     
                      ;
                    }),
              ],
            ),
          )
        ])));
  }
}
