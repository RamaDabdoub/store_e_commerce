import 'package:empty_code/core/enums/bottom_navigation.dart';
import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/main_view/main_view_widgets/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class CustomBottmNavigation extends StatefulWidget {
  final BottomNavigationEnum selectedView;
  final Function(BottomNavigationEnum, int) onTap;

  const CustomBottmNavigation(
      {super.key, required this.selectedView, required this.onTap});
  @override
  State<CustomBottmNavigation> createState() => _CustomBottmNavigationState();
}

class _CustomBottmNavigationState extends State<CustomBottmNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: screenWidth(6.3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Color.fromARGB(255, 247, 247, 247)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         
         
           NavItem(
            onTap: () {
              widget.onTap(BottomNavigationEnum.ALLPRODUCTS, 0);
            },
            icon: widget.selectedView == BottomNavigationEnum.ALLPRODUCTS
             ? Icons.shopping_bag_sharp
                : Icons.shopping_bag_outlined,
               
            isSelected: widget.selectedView == BottomNavigationEnum.ALLPRODUCTS,
            
          ),
           NavItem(
            onTap: () {
              widget.onTap(BottomNavigationEnum.HOME, 1);
            },
            icon: widget.selectedView == BottomNavigationEnum.HOME
               ? Icons.home_filled
                : Icons.home_outlined,
            isSelected: widget.selectedView == BottomNavigationEnum.HOME,
            
          ),
          NavItem(
            onTap: () {
              widget.onTap(BottomNavigationEnum.FAVORITE, 2);
            },
            icon: widget.selectedView == BottomNavigationEnum.FAVORITE
                ? Icons.favorite
                : Icons.favorite_border_rounded,
            isSelected: widget.selectedView == BottomNavigationEnum.FAVORITE,
            
          ),
          Obx(()=>
             Container(
              height: screenWidth(11),
              width:screenWidth(11),
              child: Stack(
                children:[
                 NavItem(
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.CART, 3);
                  },
                  icon: widget.selectedView == BottomNavigationEnum.CART
                      ? Icons.shopping_cart_sharp
                      : Icons.shopping_cart_outlined,
                  isSelected: widget.selectedView == BottomNavigationEnum.CART,
                 
                ),
                 Align(
                    alignment:Alignment.bottomRight,
                    child:Container(
                      height:screenWidth(22),
                      width: screenWidth(22),
                      decoration: BoxDecoration(
                        color: AppColors.redColor,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Center(child: Customtext(text:cartserivce.cartList.length.toString(),styleType: TextStyleType.CUSTOM,fontSize: screenWidth(34),fontWeight: FontWeight.w500,)),
                    ),
                  ),
                  
                    ]),
            ),
          ),
        ],
      ),
    );
  }
}
