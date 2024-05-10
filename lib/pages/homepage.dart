import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/utils/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          appBar: HeaderAppBarComponent(headerTitle: 'Home dashboard'),
          body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                          decoration: BoxDecoration(
                              color: lightOrangeColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Text(
                                "WELCOME TO THE PHILIPPINES",
                                style: TextStyle(
                                    color: orangeTwoColor,
                                    fontFamily: 'AdobeDevanagari',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.search,
                                  color: orangeTwoColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                    ),
                    Container(
                      color: lightOrangeColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "TOUR CATEGORIES",
                            style: TextStyle(
                              color: orangeTwoColor,
                              fontSize: 20,
                              fontFamily: 'AdobeDevanagari',
                            ),
                          ),
                          GestureDetector(
                            onTap: () => context.push('/home/itinerary_Collection'),
                            child: Text(
                              "See more",
                              style: TextStyle(
                                color: orangeTwoColor,
                                fontSize: 20,
                                fontFamily: 'AdobeDevanagari',
                                decoration: TextDecoration.underline
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
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
                      margin: const EdgeInsets.only(top: 20),
                    ),
                    Container(
                      color: lightOrangeColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "YOUR FAVORITES",
                            style: TextStyle(
                                color: orangeTwoColor,
                                fontFamily: 'AdobeDevanagari',
                                fontSize: 20
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5, right: 5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.grey,
                                          size: 30,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5, right: 5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.grey,
                                          size: 30,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5, right: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.grey,
                                        size: 30,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.message_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Having a problem with your planning?\nTap the AI Button", textAlign: TextAlign.center, style: TextStyle(
                          color: Colors.white,
                          fontFamily: "AdobeDevanagari",
                          fontSize: 15
                        ),
                        )
                      ],
                    ),
                    Container(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 260,
                          height: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "and let iExplorer PH suggest the best, most organized itineraries that match your style", style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "AdobeDevanagari"
                                ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingButtonNavBarComponent(),
          bottomNavigationBar: BottomNavigationBarComponent()),
    );
  }
}