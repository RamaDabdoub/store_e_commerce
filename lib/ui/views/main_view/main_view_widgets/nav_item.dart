import 'package:empty_code/ui/shared/colors.dart';
import 'package:flutter/material.dart';



class NavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Function onTap;
  
  NavItem(
      {super.key,
      required this.icon,
      required this.isSelected,
      required this.onTap,
     });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child:Container(
        
        child: Icon(
          icon,
          size: isSelected ?43:35,
          color: isSelected ? AppColors.navyColor : AppColors.blackColor,
        ),
      ),
    );
  }
}
