import 'package:flutter/material.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/pages/manila_Itinerary.dart';
import 'package:i_explore/pages/homepage.dart';
import 'package:i_explore/utils/colors.dart';

class Manila extends StatefulWidget {
  const Manila({Key? key}) : super(key: key);

  @override
  State<Manila> createState() => _ManilaState();
}

class _ManilaState extends State<Manila> {
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
        appBar: HeaderAppBarComponent(headerTitle: 'Manila City'),
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
                      "YOU ARE NOW IN MANILA CITY", style: TextStyle(
                        fontFamily: 'FSP-Demo',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white
                    ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HOW MANY DAYS WILL YOU EXPLORE?", style: TextStyle(
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
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: brownColor,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "$day DAY", style: TextStyle(
                                fontFamily: 'AdobeDevanagari',
                                fontStyle: FontStyle.italic,
                                fontSize: 20,
                                color: Colors.white
                            ),
                            ),
                          ),
                          SizedBox(width: 20),
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: FloatingActionButton(
                              backgroundColor: darkOrangeColor,
                              onPressed: (){
                                setState(() {
                                  day++;
                                });
                              },
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 3),
                          if (day > 1)
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: FloatingActionButton(
                                backgroundColor: darkOrangeColor,
                                onPressed: (){
                                  setState(() {
                                    day--;
                                  });
                                },
                                child: Icon(Icons.remove, color: Colors.white),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                      decoration: BoxDecoration(
                          color: brownColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Manila_Itinerary()));
                          },
                          child: Text(
                            "Save", style: TextStyle(
                            fontFamily: 'AdobeDevanagari',
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                            color: Colors.white
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingButtonNavBarComponent(),
          bottomNavigationBar: BottomNavigationBarComponent()
      ),
    );
  }
}
