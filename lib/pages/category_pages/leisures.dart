import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/utils/colors.dart';

class Leisures_Tours extends StatefulWidget {
  const Leisures_Tours({Key? key}) : super(key: key);

  @override
  State<Leisures_Tours> createState() => _Leisures_ToursState();
}

class _Leisures_ToursState extends State<Leisures_Tours> {
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
        appBar: HeaderAppBarComponent(headerTitle: "Leisure Tours"),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => context.push("/generate"),
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                        color: lightOrangeColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("images/AI-transparent.png",
                            width: 40, color: Colors.black),
                        Text(
                          "Generate an Itinerary now!",
                          style: TextStyle(
                              fontFamily: "AdobeDevanagari",
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "NEARBY LEISURES",
                        style: TextStyle(
                            fontFamily: 'FSP-Demo',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => context.push("/baluarte"),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "images/category_images/LEISURE/Baluarte.jpg"),
                                fit: BoxFit.fill,
                                opacity: 0.5),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor),
                        child: Center(
                          child: Text(
                            "Baluarte",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "AdobeDevanagari",
                                fontSize: 20),
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
                      onTap: () => context.push("/chinatown"),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "images/category_images/LEISURE/Chinatown.jpg"),
                                fit: BoxFit.fill,
                                opacity: 0.5),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor),
                        child: Center(
                          child: Text(
                            "Chinatown",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "AdobeDevanagari",
                                fontSize: 20),
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
                      onTap: () => context.push("/escolta"),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "images/category_images/LEISURE/Escolta.JPG"),
                                fit: BoxFit.fill,
                                opacity: 0.5),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor),
                        child: Center(
                          child: Text(
                            "Escolta",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "AdobeDevanagari",
                                fontSize: 20),
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
                      onTap: () => context.push("/jonesbridge"),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "images/category_images/LEISURE/JonesBridge.jpg"),
                                fit: BoxFit.fill,
                                opacity: 0.5),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor),
                        child: Center(
                          child: Text(
                            "Jones Bridge",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "AdobeDevanagari",
                                fontSize: 20),
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
                      onTap: () => context.push("/manilazoo"),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "images/category_images/LEISURE/ManilaZoo.jpg"),
                                fit: BoxFit.fill,
                                opacity: 0.5),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor),
                        child: Center(
                          child: Text(
                            "Manila Zoo",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "AdobeDevanagari",
                                fontSize: 20),
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
                      onTap: () => context.push("/plazaroma"),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "images/category_images/LEISURE/PlazaRoma.jpg"),
                                fit: BoxFit.fill,
                                opacity: 0.5),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor),
                        child: Center(
                          child: Text(
                            "Plaza Roma",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "AdobeDevanagari",
                                fontSize: 20),
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
