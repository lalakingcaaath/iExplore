import 'package:flutter/material.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:i_explore/pages/culinary.dart';
import 'package:i_explore/pages/adventure.dart';
import 'package:i_explore/pages/leisures.dart';
import 'package:i_explore/pages/cultures.dart';
import 'package:i_explore/pages/itinerary_schedule.dart';

class Manila_Itinerary extends StatefulWidget {
  const Manila_Itinerary({Key? key}) : super(key: key);

  @override
  State<Manila_Itinerary> createState() => _Manila_ItineraryState();
}

class _Manila_ItineraryState extends State<Manila_Itinerary> {
  int day = 1;

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
        appBar: HeaderAppBarComponent(headerTitle: 'Manila CITY'),
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
                      "$day DAY SUGGESTED IINERARY", style: TextStyle(
                        fontFamily: 'FSP-Demo',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white
                    ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 350,
                      height: 300,
                      decoration: BoxDecoration(
                        color: brownColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ItinerarySchedule()));
                            },
                            child: Center(
                              child: Text(
                                "ITINERARY FOR TODAY", style: TextStyle(
                                  fontFamily: 'AdobeDevanagari',
                                  fontSize: 20,
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                  decorationThickness: 2
                              ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "SUGGESTED PLACES AROUND MANILA \n GOOD FOR $day DAY", textAlign: TextAlign.center ,style: TextStyle(
                                    fontFamily: 'AdobeDevanagari',
                                    fontStyle: FontStyle.italic,
                                    fontSize: 15,
                                    color: Colors.white,
                                ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 15),
                                child: Text(
                                  "\u25CB National Museum of Fine Arts \n"
                                      "\u25CB Casino Espanol de Manila \n"
                                      "\u25CB Intramuros \n"
                                      "\u25CB Arroceros Forest \n"
                                      "\u25CB Binondo Chinatown \n"
                                      "\u25CB Rizal Park", style: TextStyle(
                                    fontFamily: 'AdobeDevanagari',
                                    fontStyle: FontStyle.italic,
                                    fontSize: 15,
                                    color: Colors.white
                                ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 25,
                        width: 250,
                        decoration: BoxDecoration(
                          color: lightOrangeTwoColor,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text(
                            "CUSTOMIZE YOUR OWN ITINERARY", style: TextStyle(
                            fontFamily: 'AdobeDevanagari',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: darkOrangeColor,
                          ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "EXPLORE EACH CATEGORY", style: TextStyle(
                        fontFamily: 'FSP-Demo',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white
                    ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                    ),
                    Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Culinary_Tours()));
                          },
                          child: SizedBox(
                            width: 150,
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: brownColor,
                              ),
                              child: const Center(
                                child: Text(
                                  "CULINARY",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'AdobeDevanagari',
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Container(
                      width: 40,
                    ),
                    Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){},
                          child: SizedBox(
                            width: 150,
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: brownColor,
                              ),
                              child: const Center(
                                child: Text(
                                  "ECOTOURISM",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'AdobeDevanagari',
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Container(
                      width: 40,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                    ),
                    Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Adventure_Tours()));
                          },
                          child: SizedBox(
                            width: 150,
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: brownColor,
                              ),
                              child: const Center(
                                child: Text(
                                  "ADVENTURE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'AdobeDevanagari',
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Container(
                      width: 40,
                    ),
                    Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){},
                          child: SizedBox(
                            width: 150,
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: brownColor,
                              ),
                              child: const Center(
                                child: Text(
                                  "PILGRIMAGE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'AdobeDevanagari',
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Container(
                      width: 40,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                    ),
                    Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Leisures_Tours()));
                          },
                          child: SizedBox(
                            width: 150,
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: brownColor,
                              ),
                              child: const Center(
                                child: Text(
                                  "LEISURE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'AdobeDevanagari',
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Container(
                      width: 40,
                    ),
                    Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){},
                          child: SizedBox(
                            width: 150,
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: brownColor,
                              ),
                              child: const Center(
                                child: Text(
                                  "SCHOOLS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'AdobeDevanagari',
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Container(
                      width: 40,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                    ),
                    Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Cultural_Tours()));
                          },
                          child: SizedBox(
                            width: 150,
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: brownColor,
                              ),
                              child: const Center(
                                child: Text(
                                  "CULTURAL",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'AdobeDevanagari',
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Container(
                      width: 40,
                    ),
                    Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){},
                          child: SizedBox(
                            width: 150,
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: brownColor,
                              ),
                              child: const Center(
                                child: Text(
                                  "WELLNESS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'AdobeDevanagari',
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Container(
                      width: 40,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
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
