import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/main_view/favorite_view/favorite_view_widgets/favorite_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FavoriteView extends StatefulWidget {
  FavoriteView({super.key});
 
  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Obx(() => Padding(
           padding: EdgeInsetsDirectional.only(
                  start: screenWidth(25),
                  end: screenWidth(25),
                  top: screenWidth(20),
                 ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Customtext(
                  text: 'Favorite',
                  styleType: TextStyleType.TITLE,
                  textColor: AppColors.blackColor,
                ),
                SizedBox(height: screenWidth(20)),
                Expanded(
                  child: ListView.builder(                   
                    shrinkWrap: true,
                    itemCount: favoriteservice.favoriteList.length,
                    itemBuilder: (context, index) {
                      return FavoriteWidget(
                          index: index,
                          product: favoriteservice.favoriteList[index]);
                    },
                  ),
                ),
                SizedBox(height: screenWidth(20)),
                Center(
                  child: InkWell(
                    onTap: () {
                    favoriteservice.clearFavorite();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: AppColors.redColor, width: 1))),
                      child: Customtext(
                        text: "Empty Favorite",
                        textColor: AppColors.redColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
      )),
    );
  }
}
