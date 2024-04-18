import 'package:flutter/material.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:i_explore/pages/manila.dart';

class Metro_Manila extends StatefulWidget {
  const Metro_Manila({Key? key}) : super(key: key);

  @override
  State<Metro_Manila> createState() => _Metro_ManilaState();
}

class _Metro_ManilaState extends State<Metro_Manila> {
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
        appBar: HeaderAppBarComponent(headerTitle: 'Metro Manila'),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Manila()));
                      },
                      child: Container(
                        width: 350,
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        decoration: BoxDecoration(
                            color: lightOrangeColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Manila", style: TextStyle(
                            color: orangeTwoColor,
                            fontFamily: 'AdobeDevanagari',
                            fontStyle: FontStyle.italic,
                            fontSize: 20
                          ),
                          ),
                        ),
                      ),
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
                      width: 350,
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      decoration: BoxDecoration(
                          color: lightOrangeColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Caloocan", style: TextStyle(
                            color: orangeTwoColor,
                            fontFamily: 'AdobeDevanagari',
                            fontStyle: FontStyle.italic,
                            fontSize: 20
                        ),
                        ),
                      ),
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
                      width: 350,
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      decoration: BoxDecoration(
                          color: lightOrangeColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Las Piñas", style: TextStyle(
                            color: orangeTwoColor,
                            fontFamily: 'AdobeDevanagari',
                            fontStyle: FontStyle.italic,
                            fontSize: 20
                        ),
                        ),
                      ),
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
                      width: 350,
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      decoration: BoxDecoration(
                          color: lightOrangeColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Makati", style: TextStyle(
                            color: orangeTwoColor,
                            fontFamily: 'AdobeDevanagari',
                            fontStyle: FontStyle.italic,
                            fontSize: 20
                        ),
                        ),
                      ),
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
                      width: 350,
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      decoration: BoxDecoration(
                          color: lightOrangeColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Malabon", style: TextStyle(
                            color: orangeTwoColor,
                            fontFamily: 'AdobeDevanagari',
                            fontStyle: FontStyle.italic,
                            fontSize: 20
                        ),
                        ),
                      ),
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
                      width: 350,
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      decoration: BoxDecoration(
                          color: lightOrangeColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Mandaluyong", style: TextStyle(
                            color: orangeTwoColor,
                            fontFamily: 'AdobeDevanagari',
                            fontStyle: FontStyle.italic,
                            fontSize: 20
                        ),
                        ),
                      ),
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
                      width: 350,
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      decoration: BoxDecoration(
                          color: lightOrangeColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Marikina", style: TextStyle(
                            color: orangeTwoColor,
                            fontFamily: 'AdobeDevanagari',
                            fontStyle: FontStyle.italic,
                            fontSize: 20
                        ),
                        ),
                      ),
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
                      width: 350,
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      decoration: BoxDecoration(
                          color: lightOrangeColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Muninlupa", style: TextStyle(
                            color: orangeTwoColor,
                            fontFamily: 'AdobeDevanagari',
                            fontStyle: FontStyle.italic,
                            fontSize: 20
                        ),
                        ),
                      ),
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
                      width: 350,
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      decoration: BoxDecoration(
                          color: lightOrangeColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Navotas", style: TextStyle(
                            color: orangeTwoColor,
                            fontFamily: 'AdobeDevanagari',
                            fontStyle: FontStyle.italic,
                            fontSize: 20
                        ),
                        ),
                      ),
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
                      width: 350,
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      decoration: BoxDecoration(
                          color: lightOrangeColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Parañaque", style: TextStyle(
                            color: orangeTwoColor,
                            fontFamily: 'AdobeDevanagari',
                            fontStyle: FontStyle.italic,
                            fontSize: 20
                        ),
                        ),
                      ),
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
                      width: 350,
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      decoration: BoxDecoration(
                          color: lightOrangeColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Pasay", style: TextStyle(
                            color: orangeTwoColor,
                            fontFamily: 'AdobeDevanagari',
                            fontStyle: FontStyle.italic,
                            fontSize: 20
                        ),
                        ),
                      ),
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
                      width: 350,
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      decoration: BoxDecoration(
                          color: lightOrangeColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Pasig", style: TextStyle(
                            color: orangeTwoColor,
                            fontFamily: 'AdobeDevanagari',
                            fontStyle: FontStyle.italic,
                            fontSize: 20
                        ),
                        ),
                      ),
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
                      width: 350,
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      decoration: BoxDecoration(
                          color: lightOrangeColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Quezon City", style: TextStyle(
                            color: orangeTwoColor,
                            fontFamily: 'AdobeDevanagari',
                            fontStyle: FontStyle.italic,
                            fontSize: 20
                        ),
                        ),
                      ),
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
                      width: 350,
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      decoration: BoxDecoration(
                          color: lightOrangeColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "San Juan", style: TextStyle(
                            color: orangeTwoColor,
                            fontFamily: 'AdobeDevanagari',
                            fontStyle: FontStyle.italic,
                            fontSize: 20
                        ),
                        ),
                      ),
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
                      width: 350,
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      decoration: BoxDecoration(
                          color: lightOrangeColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Valenzuela", style: TextStyle(
                            color: orangeTwoColor,
                            fontFamily: 'AdobeDevanagari',
                            fontStyle: FontStyle.italic,
                            fontSize: 20
                        ),
                        ),
                      ),
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
                      width: 350,
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      decoration: BoxDecoration(
                          color: lightOrangeColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Pateros", style: TextStyle(
                            color: orangeTwoColor,
                            fontFamily: 'AdobeDevanagari',
                            fontStyle: FontStyle.italic,
                            fontSize: 20
                        ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
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