import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/utils/colors.dart';

class Cultural_Tours extends StatefulWidget {
  const Cultural_Tours({Key? key}) : super(key: key);

  @override
  State<Cultural_Tours> createState() => _Cultural_ToursState();
}

class _Cultural_ToursState extends State<Cultural_Tours> {
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
        appBar: HeaderAppBarComponent(headerTitle: "Cultural Tours"),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "NEARBY CULTURAL SITES",
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
                      onTap: () => context.push("/ccp"),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/CULTURAL/Cultural Center of the Philippines.jpg"),
                                fit: BoxFit.fill,
                                opacity: 0.5
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "Cultural Center of the Philippines", style: TextStyle(
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
                      onTap: () => context.push("/katipunanmonument"),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/CULTURAL/KatipunanMonumentManila.jpg"),
                                fit: BoxFit.fill,
                                opacity: 0.5
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "Katipunan Monument", style: TextStyle(
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
                      onTap: () => context.push("/malacanang"),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/CULTURAL/MalacanangPalace.jpeg"),
                                fit: BoxFit.fill,
                                opacity: 0.5
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "Malacanang Palace", style: TextStyle(
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
                      onTap: () => context.push("/theater"),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/CULTURAL/Manila Metropolitan Theater.jpg"),
                                fit: BoxFit.fill,
                                opacity: 0.5
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "Manila Metropolitan Theater", style: TextStyle(
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
                      onTap: () => context.push("/museo"),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/CULTURAL/Museo de Intramuros.jpg"),
                                fit: BoxFit.fill,
                                opacity: 0.5
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "Museo de Intramuros", style: TextStyle(
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
                      onTap: () => context.push("/anthropology"),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/CULTURAL/National museum of Anthropology.jpg"),
                                fit: BoxFit.fill,
                                opacity: 0.5
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "National Museum of Antropology", style: TextStyle(
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
                      onTap: () => context.push("/finearts"),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/CULTURAL/National Museum of Fine Arts.jpg"),
                                fit: BoxFit.fill,
                                opacity: 0.5
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "National Museum of Fine Arts", style: TextStyle(
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
                      onTap: () => context.push("/naturalhistory"),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/CULTURAL/National Museum of Natural History.jpg"),
                                fit: BoxFit.fill,
                                opacity: 0.5
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "National Museum of Natural History", style: TextStyle(
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
                      onTap: () => context.push("/nationalmuseum"),
                      child: Container(
                        width: 350,
                        height: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/category_images/CULTURAL/National Museum of the Philippines.jpg"),
                                fit: BoxFit.fill,
                                opacity: 0.5
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                        ),
                        child: Center(
                          child: Text(
                            "National Museum of the Philippines", style: TextStyle(
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
