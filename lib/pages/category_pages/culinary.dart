import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/utils/colors.dart';

class Culinary_Tours extends StatefulWidget {
  const Culinary_Tours({Key? key}) : super(key: key);

  @override
  State<Culinary_Tours> createState() => _Culinary_ToursState();
}

class _Culinary_ToursState extends State<Culinary_Tours> {
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
        appBar: HeaderAppBarComponent(headerTitle: "Culinary Tours"),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "NEARBY RESTAURANTS",
                    style: TextStyle(
                        fontFamily: 'FSP-Demo',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => context.push('/barbara'),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/category_images/CULINARIES/Barbaras.jpg"),
                            fit: BoxFit.fill,
                              opacity: 0.5
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "Barbara's Heritage Restaurant", style: TextStyle(
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
                      onTap: () => context.push('/binondo'),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/CULINARIES/binondo 1.jpeg"),
                                fit: BoxFit.fill,
                                opacity: 0.5
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "Binondo", style: TextStyle(
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
                      onTap: () => context.push('/bricks'),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/CULINARIES/BricksBrew.jpg"),
                                fit: BoxFit.fill,
                                opacity: 0.5
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "Bricks & Brew", style: TextStyle(
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
                      onTap: () => context.push('/coldtreats'),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/CULINARIES/cold treats1.jpeg"),
                                fit: BoxFit.fill,
                                opacity: 0.5
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "Cold Treats - Intramuros", style: TextStyle(
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
                      onTap: () => context.push('/kapetolyo'),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/CULINARIES/Kapetolyo.jpg"),
                                fit: BoxFit.fill,
                                opacity: 0.5
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "Kapetolyo", style: TextStyle(
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
                      onTap: () => context.push('/lacathedral'),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/CULINARIES/LaCathedral-1.jpg"),
                                fit: BoxFit.fill,
                                opacity: 0.5
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "La Cathedral Cafe", style: TextStyle(
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
                      onTap: () => context.push('/skydeck'),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/CULINARIES/Skydeck-bayleaf.jpg"),
                                fit: BoxFit.fill,
                                opacity: 0.5
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "Skydeck View Bar", style: TextStyle(
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
                      onTap: () => context.push('/unsquare'),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/CULINARIES/UNsquare.jpg"),
                                fit: BoxFit.fill,
                                opacity: 0.5
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "UN Square", style: TextStyle(
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
                      onTap: () => context.push('/ugbo'),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/CULINARIES/Ugbo.jpeg"),
                                fit: BoxFit.fill,
                                opacity: 0.5
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "Ugbo", style: TextStyle(
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
