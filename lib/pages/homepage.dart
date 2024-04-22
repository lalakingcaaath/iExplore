import 'package:flutter/material.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/components/ImageCircleComponent.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:i_explore/pages/luzon.dart';
import 'package:i_explore/pages/culinary.dart';
import 'package:i_explore/pages/adventure.dart';
import 'package:i_explore/pages/leisures.dart';
import 'package:i_explore/pages/cultures.dart';

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
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        decoration: BoxDecoration(
                            color: lightOrangeColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "Which Island do you want to explore?",
                          style: TextStyle(
                              color: orangeTwoColor,
                              fontFamily: 'AdobeDevanagari',
                              fontStyle: FontStyle.italic,
                              fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => luzon()));
                        },
                        child: ImageCircleComponent(imageUrl: 'images/luzon.jpg', desc: 'Luzon')
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: ImageCircleComponent(imageUrl: 'images/visayas.jpg', desc: 'Visayas')
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: ImageCircleComponent(imageUrl: 'images/mindanao.jpg', desc: 'Mindanao')
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                  ),
                  Container(
                    color: lightOrangeColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "TOUR CATEGORIES",
                          style: TextStyle(
                            color: orangeTwoColor,
                            fontSize: 20,
                            fontFamily: 'AdobeDevanagari',
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
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
                  ),
                  Container(
                    color: lightOrangeColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "SUGGESTED ITINERARIES",
                          style: TextStyle(
                              color: orangeTwoColor,
                              fontFamily: 'AdobeDevanagari',
                              fontStyle: FontStyle.italic,
                              fontSize: 20
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                          ),
                          child: const Center(
                            child: Text(
                              "MANILA CITY",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'AdobeDevanagari',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingButtonNavBarComponent(),
        bottomNavigationBar: BottomNavigationBarComponent()
      ),
    );
  }
}
