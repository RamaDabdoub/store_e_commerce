import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class CategoryShimmerLoading extends StatelessWidget {
   final bool shouldShowShimmer;

  const CategoryShimmerLoading({super.key,  this.shouldShowShimmer= true});
   
  @override
  Widget build(BuildContext context) {
     if (!shouldShowShimmer) {
      return SizedBox.shrink(); // If shouldShowShimmer is false, return an empty sized box
    }
    return Container(
      width: screenWidth(1),
      height: screenWidth(9),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
                baseColor: Color.fromARGB(255, 233, 233, 233),
              highlightColor: Color.fromARGB(255, 224, 224, 224),
                child: Container(
                    margin: EdgeInsetsDirectional.only(start: screenWidth(40)),
                    constraints: BoxConstraints(
                        maxWidth: screenWidth(2.3), minWidth: screenWidth(5)),
                    decoration: BoxDecoration(
                        color: AppColors.graylightColor,
                        border: Border.all(
                            width: screenWidth(300),
                            color: AppColors.graylightColor),
                        borderRadius: BorderRadius.circular(screenWidth(30)))));
          }),
    );
  }
}

class ProductShimmerLoading extends StatelessWidget {
  const ProductShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(1),
      height: screenWidth(0.7),
      child: GridView.builder(
        padding: EdgeInsets.all(screenWidth(40)),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: screenWidth(40),
            crossAxisSpacing: screenWidth(40),
            childAspectRatio: 0.69),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
              baseColor: Color.fromARGB(255, 233, 233, 233),
              highlightColor: Color.fromARGB(255, 224, 224, 224),
              period: Duration(milliseconds: 1000),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.graylightColor,
                    border: Border.all(color: AppColors.graylightColor),
                    borderRadius: BorderRadius.circular(15)),
                width: screenWidth(4),
              
              ));
        },
      ),
    );
  }
}

class TextShimmer extends StatelessWidget {
  final String text;
  const TextShimmer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
                      baseColor: AppColors.blackColor,
                      highlightColor: AppColors.navyColor,
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.0,
                          
                        ),
                      ),
                    );
  }
}
