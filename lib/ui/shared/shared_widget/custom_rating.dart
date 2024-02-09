import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class CustomStars extends StatelessWidget {
  final double rate, size;
  const CustomStars({super.key, required this.rate, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: screenWidth(10),
      child: RatingBar.builder(
          initialRating: rate,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: size,
          itemPadding: EdgeInsets.symmetric(horizontal:screenWidth(200)),
          itemBuilder: (context, _) => Icon(
                Icons.star,
                color: AppColors.navyColor,
              ),
           unratedColor: Color.fromARGB(255, 187, 195, 226),    
          onRatingUpdate: (rating) {
            print(rating);
          }),
    );
  }
}
