import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:go_router/go_router.dart';

class Adamson extends StatefulWidget {
  const Adamson({super.key});

  @override
  State<Adamson> createState() => _AdamsonState();
}

class _AdamsonState extends State<Adamson> {
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
                  "ADU WEBSITE", style: TextStyle(
                    fontFamily: "FSP-Demo",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("images/category_images/SCHOOL_HERO/adu.png", width: 350)
              ],
            ),
            SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "About", style: TextStyle(
                      fontFamily: "AdobeDevanagari",
                      fontSize: 20,
                      color: Colors.white
                    ),
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
                        color: Colors.white
                    ),
                    children: [
                      TextSpan(
                          text: "Adamson University has endured the tests of history, "
                              "first as a Greek-run school and then as a Catholic "
                              "and Vincentian institution. It has emerged "
                              "academically richer and stronger, accumulating "
                              "layers of knowledge and experience that sustain its "
                              "mission to provide education—the kind that meets "
                              "stringent standards of quality yet affordable to those "
                              "who have less. Now beyond its Diamond Jubilee, it "
                              "confidently and ably plays its role as an agent of "
                              "personal as well as social transformation.\n"
                      ),
                      TextSpan(
                        text: "See more", style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      )
                    ]
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Trivia!", style: TextStyle(
                      fontFamily: "AdobeDevanagari",
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      color: Colors.white
                    ),
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
                          fontSize: 12,
                          color: Colors.black
                        ),
                        children: [
                          TextSpan(
                            text: "Adamson University soars in\n2024 QS Asia Rankings\n", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                            )
                          ),
                          TextSpan(
                            text: "Adamson University was ranked in\nthe top 5 best universities" 
                            "in the\nPhilippines after it posted vast\nimprovements in the results of\nQS’ annual review.\n"
                          ),
                          TextSpan(
                            text: "Read more", style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          )
                        ]
                      ),
                    ),
                  ),
                  Spacer(),
                  Image.asset("images/adu_news.JPG", width: 200)
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
                    "Location", style: TextStyle(
                      fontFamily: "AdobeDevanagari",
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      color: Colors.white
                    ),
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
                      initialCenter: LatLng(14.586254, 120.986361),
                      initialZoom: 17
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: "https://api.mapbox.com/styles/v1/lalakingcaaath/clw756vue028t01rjcd6jcfrg/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibGFsYWtpbmdjYWFhdGgiLCJhIjoiY2x3MjV2b2trMGpvMjJqcXVkenlyM252dyJ9.L8_2gdCOPZlX0htFguf6DQ",
                        additionalOptions: {
                          "accessToken": "pk.eyJ1IjoibGFsYWtpbmdjYWFhdGgiLCJhIjoiY2x3MjV2b2trMGpvMjJqcXVkenlyM252dyJ9.L8_2gdCOPZlX0htFguf6DQ"
                        },
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(14.586213, 120.986162),
                            width: 10,
                            height: 10,
                            child: Icon(
                              Icons.pin_drop, color: Colors.red, size: 20,
                            )
                          )
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
                    "Address", style: TextStyle(
                      fontFamily: "AdobeDevanagari",
                      fontSize: 20,
                      color: Colors.white
                    ),
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
                    "900 San Marcelino Street, Ermita 1000\nManila, Philippines", style: TextStyle(
                      fontFamily: "AdobeDevanagari",
                      fontSize: 18,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      decorationColor: Colors.white
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You can go to our AiExplorer chat bot for assistance to get there", style: TextStyle(
                    fontFamily: "AdobeDevanagari",
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    color: Colors.white
                  ),
                )
              ],
            ),
            SizedBox(height: 50),
            Container(
              child: Text(
                "Nearby Local Restaurants You Must Try!", style: TextStyle(
                  fontFamily: "AdobeDevanagari",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
            Container(
              height: 100,
              child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
              _itineraryCard(context, "StrEatside Coffee & Tea", "images/category_images/SCHOOL_CARDS/streatside.jpg", "/home"),
              _itineraryCard(context, "Dina's Eatery", "images/category_images/SCHOOL_CARDS/penny_eatery.jpg", "/home"),
              _itineraryCard(context, "You have a restaurant nearby? Sign your restaurant up for visibility! Click here to Sign Up", "", "/home")
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
Widget _itineraryCard(BuildContext context, String title, String imagePath, String pageRoute) {
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
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
         Center(
           child: Text(
             title, textAlign: TextAlign.center, style: TextStyle(
             color: Colors.white,
             fontFamily: "AdobeDevanagari",
             fontWeight: FontWeight.bold,
             fontSize: 13
           ),
           ),
         )
        ],
      ),
    ),
  );
}