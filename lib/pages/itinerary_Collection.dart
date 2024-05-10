import 'package:flutter/material.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:go_router/go_router.dart';

class ItineraryCollection extends StatelessWidget {
  const ItineraryCollection({Key? key}) : super(key: key);

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
        appBar: HeaderAppBarComponent(headerTitle: "Tour Categories",),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => context.push('/home/culinaries'),
                      child: Container(
                        width: 120,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "CULINARY", style: TextStyle(
                                color: Colors.white,
                                fontFamily: "AdobeDevanagari",
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 120,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "ECOTOURISM", style: TextStyle(
                                color: Colors.white,
                                fontFamily: "AdobeDevanagari",
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 120,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "SCHOOLS", style: TextStyle(
                                color: Colors.white,
                                fontFamily: "AdobeDevanagari",
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 120,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "HOTELS", style: TextStyle(
                                color: Colors.white,
                                fontFamily: "AdobeDevanagari",
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 120,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "ADVENTURE", style: TextStyle(
                                color: Colors.white,
                                fontFamily: "AdobeDevanagari",
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 120,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "LEISURE", style: TextStyle(
                                color: Colors.white,
                                fontFamily: "AdobeDevanagari",
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 120,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "PILGRIMAGE", style: TextStyle(
                                color: Colors.white,
                                fontFamily: "AdobeDevanagari",
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 120,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "CULTURAL", style: TextStyle(
                                color: Colors.white,
                                fontFamily: "AdobeDevanagari",
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
