import 'package:flutter/material.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/utils/colors.dart';

class LaSalle extends StatefulWidget {
  const LaSalle({super.key});

  @override
  State<LaSalle> createState() => _LaSalleState();
}

class _LaSalleState extends State<LaSalle> {
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
      appBar: HeaderAppBarComponent(headerTitle: "School Tours"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "DLSU WEBSITE", style: TextStyle(
                    fontFamily: "FSP-Demo",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white
                  ),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingButtonNavBarComponent(),
      bottomNavigationBar: BottomNavigationBarComponent(),
    ),
    );
  }
}