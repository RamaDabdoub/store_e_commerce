import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/map_view/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapView extends StatefulWidget {
  final LocationData currentLocation;
   final Function(LatLng)? onLocationSelected;
    final Function(LatLng)? locationSetter;

  const MapView({super.key, required this.currentLocation, this.onLocationSelected, this.locationSetter});

  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
   void _returnSelectedLocation(MapController mapController) {
    if (widget.onLocationSelected != null && mapController.selectedLocation != null) {
      widget.onLocationSelected!(mapController.selectedLocation);


       if (widget.locationSetter != null) {
        widget.locationSetter!(mapController.selectedLocation);
      }
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MapController(widget.currentLocation),
        builder: (MapController mapController) {
          return
            AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: SizedBox(
                width: double.maxFinite,
                height: screenHeight(1.2),
                child: Column(
                  children: [
                    Expanded(
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: mapController.initalCameraPosition,
                        onMapCreated: (GoogleMapController controller) {
                          mapController.controller.complete(controller);
                                
                          mapController.addMarker(
                              // imageName: 'pin.png',
                              markerId: 'Current',
                              position: LatLng(
                                  mapController.currentLocation.latitude ??
                                      37.43296265331129,
                                  mapController.currentLocation.longitude ??
                                      -122.08832357078792));
                                
                          mapController.selectedLocation = LatLng(
                              mapController.currentLocation.latitude ?? 37.43296265331129,
                              mapController.currentLocation.longitude ??
                                  -122.08832357078792);
                                
                          mapController.getStreetName();
                        },
                        markers: mapController.markers,
                        onTap: (latlong) async {
                          mapController.selectedLocation = latlong;
                                
                          mapController.addMarker(
                              // imageName: 'pin.png',
                              markerId: 'Current',
                              position: LatLng(latlong.latitude, latlong.longitude));
                                
                          mapController.getStreetName();
                        },
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: screenWidth(20),top: screenWidth(10)),
                    child:FloatingActionButton(
                      backgroundColor:AppColors.navyColor,
                     onPressed: () {
          _returnSelectedLocation(mapController);
          Get.back();
        },
                      child: Icon(Icons.check,color: AppColors.whiteColor,),) ,)

                  ],
                ),
              ),
            );
            // floatingActionButton: FloatingActionButton.extended(
            //   onPressed: () {},
            //   label: Text(mapController.streetName.value),
            //   icon: const Icon(Icons.directions_boat),
            // ),
          
        });
  }
}
