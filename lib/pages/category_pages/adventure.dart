import 'package:flutter/material.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/utils/colors.dart';

class Adventure_Tours extends StatefulWidget {
  const Adventure_Tours({Key? key}) : super(key: key);

  @override
  State<Adventure_Tours> createState() => _Adventure_ToursState();
}

class _Adventure_ToursState extends State<Adventure_Tours> {
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
        appBar: HeaderAppBarComponent(headerTitle: "Adventure Tours"),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "NEARBY ADVENTURE SITES",
                    style: TextStyle(
                        fontFamily: 'FSP-Demo',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/ADVENTURE/Bambike.png"),
                                fit: BoxFit.fill
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "Bambike", style: TextStyle(
                              color: Colors.white,
                              fontFamily: "AdobeDevanagari",
                              fontSize: 20
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/ADVENTURE/ClubIntramurosGolf.jpg"),
                                fit: BoxFit.fill
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "Intramuros Golf Club", style: TextStyle(
                              color: Colors.white,
                              fontFamily: "AdobeDevanagari",
                              fontSize: 20
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/ADVENTURE/Craft Academy.jpg"),
                                fit: BoxFit.fill
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "Craft Academy", style: TextStyle(
                              color: Colors.white,
                              fontFamily: "AdobeDevanagari",
                              fontSize: 20
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/ADVENTURE/Kalesa.jpg"),
                                fit: BoxFit.fill
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "Kalesa - Intramuros", style: TextStyle(
                              color: Colors.white,
                              fontFamily: "AdobeDevanagari",
                              fontSize: 20
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/ADVENTURE/WhiteKnight.jpg"),
                                fit: BoxFit.fill
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "White Knight", style: TextStyle(
                              color: Colors.white,
                              fontFamily: "AdobeDevanagari",
                              fontSize: 20
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 20,
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
