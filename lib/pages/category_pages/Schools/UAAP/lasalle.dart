import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LaSalle extends StatefulWidget {
  const LaSalle({super.key});

  @override
  State<LaSalle> createState() => _LaSalleState();
}

class _LaSalleState extends State<LaSalle> {
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
        appBar: HeaderAppBarComponent(headerTitle: "School Tours"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "DLSU WEBSITE",
                    style: TextStyle(
                        fontFamily: "FSP-Demo",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/category_images/SCHOOL_HERO/dlsu.png",
                      width: 350)
                ],
              ),
              SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "About",
                      style: TextStyle(
                          fontFamily: "AdobeDevanagari",
                          fontSize: 20,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                        style: TextStyle(
                            fontFamily: "AdobeDevanagari",
                            fontSize: 15,
                            color: Colors.white),
                        children: [
                          TextSpan(
                              text:
                                  "De La Salle University positions itself as a leader in molding "
                                  "human resources who serve the church and the nation. It is "
                                  "a Catholic coeducational institution founded in 1911 by the "
                                  "Brothers of the Christian Schools. The University is a hub "
                                  "for higher education training renowned for its academic "
                                  "excellence, prolific and relevant research, and involved "
                                  "community service.\n"),
                          TextSpan(
                            text: "See more",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => launchUrlString(
                                  "https://www.dlsu.edu.ph/about-dlsu/",
                                  mode: LaunchMode.externalApplication),
                          )
                        ]),
                  )),
              SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Trivia!",
                      style: TextStyle(
                          fontFamily: "AdobeDevanagari",
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                color: lightOrangeColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            style: TextStyle(
                                fontFamily: "AdobeDevanagari",
                                fontSize: 10,
                                color: Colors.black),
                            children: [
                              TextSpan(
                                  text:
                                      "DLSU remains as PHL's\nleading private university\nin latest EduRank standings\n",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13)),
                              TextSpan(
                                  text:
                                      "De La Salle University\nremains as the leading"
                                      "private\nPhilippines after it posted vast\nimprovements in the results of\nQS’ annual review.\n"),
                              TextSpan(
                                text: "Read more",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => launchUrlString(
                                      "https://www.dlsu.edu.ph/dlsu-remains-as-phls-leading-private-university-in-latest-edurank-standings/#:~:text=De%20La%20Salle%20University%20remains,Science%2C%20Mathematics%2C%20and%20Psychology",
                                      mode: LaunchMode.externalApplication),
                              )
                            ]),
                      ),
                    ),
                    Spacer(),
                    Image.asset("images/dlsu_news.JPG", width: 200)
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(
                          fontFamily: "AdobeDevanagari",
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 325,
                    height: 325,
                    child: FlutterMap(
                      options: MapOptions(
                          initialCenter:
                              LatLng(14.564806076581478, 120.99341277618228),
                          initialZoom: 15),
                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://api.mapbox.com/styles/v1/lalakingcaaath/clw756vue028t01rjcd6jcfrg/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibGFsYWtpbmdjYWFhdGgiLCJhIjoiY2x3MjV2b2trMGpvMjJqcXVkenlyM252dyJ9.L8_2gdCOPZlX0htFguf6DQ",
                          additionalOptions: {
                            "accessToken":
                                "pk.eyJ1IjoibGFsYWtpbmdjYWFhdGgiLCJhIjoiY2x3MjV2b2trMGpvMjJqcXVkenlyM252dyJ9.L8_2gdCOPZlX0htFguf6DQ"
                          },
                        ),
                        MarkerLayer(
                          markers: [
                            // Taft Campus
                            Marker(
                                point: LatLng(14.5641, 120.9936),
                                width: 10,
                                height: 10,
                                child: Icon(
                                  Icons.pin_drop,
                                  color: Colors.red,
                                  size: 20,
                                )),
                            // CSB
                            Marker(
                                point: LatLng(14.5618, 120.9940),
                                width: 10,
                                height: 10,
                                child: Icon(
                                  Icons.pin_drop,
                                  color: Colors.red,
                                  size: 20,
                                )),
                            // CSB - School of Design and Arts
                            Marker(
                                point: LatLng(14.5610, 120.9957),
                                width: 10,
                                height: 10,
                                child: Icon(
                                  Icons.pin_drop,
                                  color: Colors.red,
                                  size: 20,
                                )),
                            // CSB - Angelo King Internation Center
                            Marker(
                                point: LatLng(14.5616, 120.9965),
                                width: 10,
                                height: 10,
                                child: Icon(
                                  Icons.pin_drop,
                                  color: Colors.red,
                                  size: 20,
                                )),
                            // St. Miguel Hall (Pre-School)
                            Marker(
                                point: LatLng(14.5636, 120.9943),
                                width: 10,
                                height: 10,
                                child: Icon(
                                  Icons.pin_drop,
                                  color: Colors.red,
                                  size: 20,
                                )),
                            // Alumni Center
                            Marker(
                                point: LatLng(14.5639, 120.9940),
                                width: 10,
                                height: 10,
                                child: Icon(
                                  Icons.pin_drop,
                                  color: Colors.red,
                                  size: 20,
                                )),
                            // Bro. Andrew Gonzales Hall
                            Marker(
                                point: LatLng(14.5652, 120.9933),
                                width: 10,
                                height: 10,
                                child: Icon(
                                  Icons.pin_drop,
                                  color: Colors.red,
                                  size: 20,
                                )),
                            // Henry Sy Sr. Hall
                            Marker(
                                point: LatLng(14.5641, 120.9937),
                                width: 10,
                                height: 10,
                                child: Icon(
                                  Icons.pin_drop,
                                  color: Colors.red,
                                  size: 20,
                                )),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Address",
                      style: TextStyle(
                          fontFamily: "AdobeDevanagari",
                          fontSize: 20,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "900 San Marcelino Street, Ermita 1000\n"
                      "Manila, Philippines 2401 Taft Ave,\n"
                      "Malate, Manila, 1004 Metro Manila",
                      style: TextStyle(
                          fontFamily: "AdobeDevanagari",
                          fontSize: 18,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                          decorationColor: Colors.white),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You can go to our AiExplorer chat bot for assistance to get there",
                    style: TextStyle(
                        fontFamily: "AdobeDevanagari",
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  )
                ],
              ),
              SizedBox(height: 50),
              Container(
                child: Text(
                  "Nearby Local Restaurants You Must Try!",
                  style: TextStyle(
                      fontFamily: "AdobeDevanagari",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _itineraryCard(
                        context,
                        "Jus & Jerry's EGI Taft",
                        "images/category_images/SCHOOL_CARDS/jusjerry.JPG",
                        "/home"),
                    _itineraryCard(context, "BOK Korean Fried Chicken - Taft",
                        "images/category_images/SCHOOL_CARDS/bok.jpg", "/home"),
                    _itineraryCard(
                        context,
                        "You have a restaurant nearby? Sign your restaurant up for visibility! Click here to Sign Up",
                        "",
                        "/home")
                  ],
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingButtonNavBarComponent(),
        bottomNavigationBar: BottomNavigationBarComponent(),
      ),
    );
  }
}

//Scrollable Itinerary Cards
Widget _itineraryCard(
    BuildContext context, String title, String imagePath, String pageRoute) {
  return GestureDetector(
    onTap: () => context.push(pageRoute),
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 120,
      decoration: BoxDecoration(
          color: brownColor,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.fill,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "AdobeDevanagari",
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            ),
          )
        ],
      ),
    ),
  );
}
