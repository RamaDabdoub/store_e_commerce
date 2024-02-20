import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_row.dart';
import 'package:empty_code/ui/shared/shared_widget/cutsom_button_order.dart';
import 'package:empty_code/ui/shared/shared_widget/price_detail.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/checkout_view/checkout_controller.dart';
import 'package:empty_code/ui/views/map_view/map_view.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class CheckOutView extends StatefulWidget {
  CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  CheckoutController controller = Get.put(CheckoutController());
  void _onLocationSelected(LatLng  selectedLocation) {
    // Handle the selected location data here
    print('Selected location: ${selectedLocation.latitude}, ${selectedLocation.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomButtonOrder(
          text: 'Continue Shopping',
          onPressed: () {
            controller.onPlacedOrder();
          },
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.only(
            start: screenWidth(25),
            end: screenWidth(25),
            top: screenWidth(20),
          ),
          child: ListView(
            children: [
              Customtext(
                text: 'Your order placed successfully',
                styleType: TextStyleType.TITLE,
                textColor: AppColors.blackColor,
                maxLines: 100,
              ),
              SizedBox(
                height: screenWidth(15),
              ),
              CustomRowText(
                textone: 'Order NO:',
                texttwo: '#123910',
                fontSize: screenWidth(22),
              ),
              SizedBox(
                height: screenWidth(22),
              ),
              CustomRowText(
                textone: 'Items Count:',
                texttwo: cartserivce.cartList.length.toString(),
                fontSize: screenWidth(22),
              ),
              SizedBox(
                height: screenWidth(8),
              ),
              PriceDetail(),
               SizedBox(
                height: screenWidth(22),
              ),
             ElevatedButton.icon(
  onPressed: () async {
    LocationData? locationData = await locationService.getCurrentLocation(showLoader: true);

    if (locationData != null) {
      print(locationData);
      print(locationService.getLocationInfo(locationData));

      // Show MapView within a dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return MapView(
                  currentLocation: locationData,
                  onLocationSelected: (selectedLocation) {
              
              _onLocationSelected(selectedLocation);
              
            },
                );
          
         
        },
      );
    }
  },
  icon: Icon(Icons.location_on),
  label: Text('Select Location from Map'),
)
            ],
          ),
        ),
      ),
    );
  }
}
