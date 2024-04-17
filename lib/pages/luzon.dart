import 'package:flutter/material.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/utils/colors.dart';

class luzon extends StatefulWidget {
  const luzon({Key? key}) : super(key: key);

  @override
  State<luzon> createState() => _luzonState();
}

class _luzonState extends State<luzon> {
  bool isDropdownVisible = false;

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
        appBar: HeaderAppBarComponent(headerTitle: 'Luzon Island'),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 350,
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          decoration: BoxDecoration(
                              color: lightOrangeColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Spacer(),
                              Center(
                                child: Text(
                                  "Ilocos Region (Region I)",
                                  style: TextStyle(
                                      color: orangeTwoColor,
                                      fontFamily: 'AdobeDevanagari',
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20
                                  ),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_drop_down,
                                color: darkOrangeColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 350,
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          decoration: BoxDecoration(
                              color: lightOrangeColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Spacer(),
                              Center(
                                child: Text(
                                  "Cagayan Valley (Region II)",
                                  style: TextStyle(
                                      color: orangeTwoColor,
                                      fontFamily: 'AdobeDevanagari',
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20
                                  ),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_drop_down,
                                color: darkOrangeColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 350,
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          decoration: BoxDecoration(
                              color: lightOrangeColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Spacer(),
                              Center(
                                child: Text(
                                  "Central Luzon (Region III)",
                                  style: TextStyle(
                                      color: orangeTwoColor,
                                      fontFamily: 'AdobeDevanagari',
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20
                                  ),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_drop_down,
                                color: darkOrangeColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 350,
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          decoration: BoxDecoration(
                              color: lightOrangeColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Spacer(),
                              Center(
                                child: Text(
                                  "CALABARZON (Region IV-A)",
                                  style: TextStyle(
                                      color: orangeTwoColor,
                                      fontFamily: 'AdobeDevanagari',
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20
                                  ),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_drop_down,
                                color: darkOrangeColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 350,
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            decoration: BoxDecoration(
                                color: lightOrangeColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Spacer(),
                                Center(
                                  child: Text(
                                    "Bicol Region (Region V)",
                                    style: TextStyle(
                                        color: orangeTwoColor,
                                        fontFamily: 'AdobeDevanagari',
                                        fontStyle: FontStyle.italic,
                                        fontSize: 20
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: darkOrangeColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isDropdownVisible = !isDropdownVisible;
                            });
                          },
                          child: Container(
                            width: 350,
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            decoration: BoxDecoration(
                                color: lightOrangeColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Spacer(),
                                Center(
                                  child: Text(
                                    "National Capital Region (NCR)",
                                    style: TextStyle(
                                        color: orangeTwoColor,
                                        fontFamily: 'AdobeDevanagari',
                                        fontStyle: FontStyle.italic,
                                        fontSize: 20
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  isDropdownVisible ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                                  color: darkOrangeColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 10)
                        ),
                        Visibility(
                            visible: isDropdownVisible,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              height: isDropdownVisible ? 30 : 0,
                              child: Center(
                                child: Container(
                                  width: 300,
                                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                                  decoration: BoxDecoration(
                                      color: orangeThreeColor,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Metro Manila",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'AdobeDevanagari',
                                          fontStyle: FontStyle.italic,
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 350,
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          decoration: BoxDecoration(
                              color: lightOrangeColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Spacer(),
                              Center(
                                child: Text(
                                  "Cordillera Administrative Region",
                                  style: TextStyle(
                                      color: orangeTwoColor,
                                      fontFamily: 'AdobeDevanagari',
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20
                                  ),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_drop_down,
                                color: darkOrangeColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 350,
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          decoration: BoxDecoration(
                              color: lightOrangeColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Spacer(),
                              Center(
                                child: Text(
                                  "MIMAROPA Region",
                                  style: TextStyle(
                                      color: orangeTwoColor,
                                      fontFamily: 'AdobeDevanagari',
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20
                                  ),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_drop_down,
                                color: darkOrangeColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
