import 'package:flutter/material.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Manila_Itinerary extends StatefulWidget {
  const Manila_Itinerary({Key? key}) : super(key: key);

  @override
  State<Manila_Itinerary> createState() => _Manila_ItineraryState();
}

class _Manila_ItineraryState extends State<Manila_Itinerary> {
  int day = 1;
  int hours = 5;

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
  }

  Future<void> requestLocationPermission() async {
    PermissionStatus status = await Permission.locationWhenInUse.request();
    if (status.isGranted) {
      //Location permission granted, proceed with using location
    } else if (status.isDenied) {
      //Location permission denied by user
      //Logic goes here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [orangeOneColor, orangeTwoColor, orangeThreeColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: HeaderAppBarComponent(headerTitle: 'Digi-Companion'),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hi Name!", style: TextStyle(
                        fontFamily: 'FSP-Demo',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white
                    ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 325,
                      height: 325,
                      child: FlutterMap(
                        options: MapOptions(
                          initialCenter: LatLng(14.604397, 120.979832),
                          initialZoom: 12
                        ),
                        children: [
                          TileLayer(
                            urlTemplate: "https://api.mapbox.com/styles/v1/lalakingcaaath/clw35cv64020601q1dtcg0908/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibGFsYWtpbmdjYWFhdGgiLCJhIjoiY2x3MjV2b2trMGpvMjJqcXVkenlyM252dyJ9.L8_2gdCOPZlX0htFguf6DQ",
                            additionalOptions: {
                              "accessToken": "pk.eyJ1IjoibGFsYWtpbmdjYWFhdGgiLCJhIjoiY2x3MjV2b2trMGpvMjJqcXVkenlyM252dyJ9.L8_2gdCOPZlX0htFguf6DQ"
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: brownColor
                      ),
                      child: Center(
                        child: Text(
                          "YOUR $hours HOURS SUGGESTED ITINERARY", style: TextStyle(
                            fontFamily: 'FSP-Demo',
                            fontSize: 15,
                            color: Colors.white
                        ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingButtonNavBarComponent(),
        bottomNavigationBar: BottomNavigationBarComponent(),
      ),
    );
  }
}
