import 'package:flutter/material.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:i_explore/pages/category_pages/culinary.dart';
import 'package:i_explore/pages/category_pages/adventure.dart';
import 'package:i_explore/pages/category_pages/leisures.dart';
import 'package:i_explore/pages/category_pages/cultures.dart';
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
        appBar: HeaderAppBarComponent(headerTitle: 'Digi-Companion'),
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
                      "Hi Name!", style: TextStyle(
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
