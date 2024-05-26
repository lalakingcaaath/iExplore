import 'package:flutter/material.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:typethis/typethis.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ItineraryGenerator extends StatefulWidget {
  const ItineraryGenerator({Key? key}) : super(key: key);

  @override
  State<ItineraryGenerator> createState() => _ItineraryGeneratorState();
}

class _ItineraryGeneratorState extends State<ItineraryGenerator> {
  String? _name;
  int day = 1;
  int hour = 1;
  bool isHidden = false;
  bool isCulinary = false;
  bool isAdventure = false;
  bool isEcotourism = false;
  bool isLeisure = false;
  bool isSchools = false;
  bool isPilgrimage = false;
  bool isHotels = false;
  bool isCultural = false;

  @override
  void initState() {
    super.initState();
    AuthService authService = Provider.of<AuthService>(context, listen: false);
    _name = authService.user?.displayName;
  }

  void dayIncrement() {
    setState(() {
      day++;
    });
  }

  void dayDecrement() {
    setState(() {
      day--;
    });
  }

  void hourIncrement() {
    setState(() {
      hour++;
    });
  }

  void hourDecrement() {
    setState(() {
      hour--;
    });
  }

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
        appBar: HeaderAppBarComponent(headerTitle: "Itinerary Generator"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TypeThis(string:
                  "Hi $_name",
                    style: TextStyle(
                      fontFamily: 'FSP-Demo',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    speed: 150,
                    showBlinkingCursor: false,
                  ),
                  TypeThis(string:
                  "!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),
                    speed: 150,
                    showBlinkingCursor: false,
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TypeThis(
                    string: "READY TO EXPLORE IN ONE CLICK", textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'FSP-Demo',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white
                    ),
                    speed: 150,
                    showBlinkingCursor: false,
                  ),
                ],
              ),
              SizedBox(height: 10),
              ImageSlideshow(
                  width: 350,
                  initialPage: 0,
                  indicatorBackgroundColor: Colors.grey,
                  autoPlayInterval: 2500,
                  isLoop: false,
                  children: [
                    Image.asset(
                      "images/category_images/ADVENTURE/Bambike.png",
                      fit: BoxFit.cover
                    ),
                    Image.asset(
                        "images/category_images/ADVENTURE/ClubIntramurosGolf.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                        "images/category_images/ADVENTURE/Craft Academy.jpg",
                        fit: BoxFit.cover
                    ),
                    Image.asset(
                      "images/category_images/ADVENTURE/Kalesa.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                        "images/category_images/ADVENTURE/WhiteKnight.jpg",
                        fit: BoxFit.cover
                    ),
                  ]
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Generate your itinerary based on your preference", style: TextStyle(
                    fontFamily: "AdobeDevanagari",
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white
                  ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 64,
                    width: 150,
                    decoration: BoxDecoration(
                        color: brownColor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: day > 1
                        ? Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonComponent(
                          icon: Icons.remove,
                          func: dayDecrement,
                        ),
                        Text(
                          "$day day",
                          style: TextStyle(
                              fontFamily: 'AdobeDevanagari',
                              fontSize: 15,
                              color: Colors.white),
                        ),
                        ButtonComponent(
                            icon: Icons.add, func: dayIncrement),
                      ],
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(flex: 1, child: Icon(Icons.sunny, color: Colors.white, size: 30)),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "$day day",
                            style: TextStyle(
                                fontFamily: 'AdobeDevanagari',
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: ButtonComponent(
                            icon: Icons.add,
                            func: dayIncrement,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 64,
                    width: 150,
                    decoration: BoxDecoration(
                        color: brownColor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: hour > 1
                        ? Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonComponent(
                          icon: Icons.remove,
                          func: hourDecrement,
                        ),
                        Text(
                          "$hour hour",
                          style: TextStyle(
                              fontFamily: 'AdobeDevanagari',
                              fontSize: 15,
                              color: Colors.white),
                        ),
                        ButtonComponent(
                            icon: Icons.add, func: hourIncrement),
                      ],
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(flex: 1, child: Icon(Icons.access_time_filled, color: Colors.white, size: 30)),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "$hour hour",
                            style: TextStyle(
                                fontFamily: 'AdobeDevanagari',
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: ButtonComponent(
                            icon: Icons.add,
                            func: hourIncrement,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 290,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: brownColor
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search, color: Colors.white, size: 30),
                              Text(
                                "Tour Category", style: TextStyle(
                                fontFamily: "AdobeDevanagari",
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white
                              ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "You can select more than one category", style: TextStyle(
                                fontFamily: "AdobeDevanagari",
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                color: Colors.white
                              ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 125,
                                child: Row(
                                  children: [
                                    Checkbox(
                                        activeColor: Colors.transparent,
                                        side: BorderSide(color: Colors.white, width: 2),
                                        checkColor: Colors.white,
                                        value: isCulinary,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isCulinary = value!;
                                          });
                                        }
                                    ),
                                    Text(
                                      "Culinary", style: TextStyle(
                                        fontFamily: "AdobeDevanagari",
                                        fontSize: 15,
                                        color: Colors.white
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 125,
                                child: Row(
                                  children: [
                                    Checkbox(
                                        activeColor: Colors.transparent,
                                        side: BorderSide(color: Colors.white, width: 2),
                                        checkColor: Colors.white,
                                        value: isAdventure,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isAdventure = value!;
                                          });
                                        }
                                    ),
                                    Text(
                                      "Adventure", style: TextStyle(
                                        fontFamily: "AdobeDevanagari",
                                        fontSize: 15,
                                        color: Colors.white
                                    ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 125,
                                child: Row(
                                  children: [
                                    Checkbox(
                                        activeColor: Colors.transparent,
                                        side: BorderSide(color: Colors.white, width: 2),
                                        checkColor: Colors.white,
                                        value: isEcotourism,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isEcotourism = value!;
                                          });
                                        }
                                    ),
                                    Text(
                                      "Ecotourism", style: TextStyle(
                                        fontFamily: "AdobeDevanagari",
                                        fontSize: 15,
                                        color: Colors.white
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 125,
                                child: Row(
                                  children: [
                                    Checkbox(
                                        activeColor: Colors.transparent,
                                        side: BorderSide(color: Colors.white, width: 2),
                                        checkColor: Colors.white,
                                        value: isLeisure,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isLeisure = value!;
                                          });
                                        }
                                    ),
                                    Text(
                                      "Leisure", style: TextStyle(
                                        fontFamily: "AdobeDevanagari",
                                        fontSize: 15,
                                        color: Colors.white
                                    ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 125,
                                child: Row(
                                  children: [
                                    Checkbox(
                                        activeColor: Colors.transparent,
                                        side: BorderSide(color: Colors.white, width: 2),
                                        checkColor: Colors.white,
                                        value: isSchools,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isSchools = value!;
                                          });
                                        }
                                    ),
                                    Text(
                                      "Schools", style: TextStyle(
                                        fontFamily: "AdobeDevanagari",
                                        fontSize: 15,
                                        color: Colors.white
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 125,
                                child: Row(
                                  children: [
                                    Checkbox(
                                        activeColor: Colors.transparent,
                                        side: BorderSide(color: Colors.white, width: 2),
                                        checkColor: Colors.white,
                                        value: isPilgrimage,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isPilgrimage = value!;
                                          });
                                        }
                                    ),
                                    Text(
                                      "Pilgrimage", style: TextStyle(
                                        fontFamily: "AdobeDevanagari",
                                        fontSize: 15,
                                        color: Colors.white
                                    ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 125,
                                child: Row(
                                  children: [
                                    Checkbox(
                                        activeColor: Colors.transparent,
                                        side: BorderSide(color: Colors.white, width: 2),
                                        checkColor: Colors.white,
                                        value: isHotels,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isHotels = value!;
                                          });
                                        }
                                    ),
                                    Text(
                                      "Hotels", style: TextStyle(
                                        fontFamily: "AdobeDevanagari",
                                        fontSize: 15,
                                        color: Colors.white
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 125,
                                child: Row(
                                  children: [
                                    Checkbox(
                                        activeColor: Colors.transparent,
                                        side: BorderSide(color: Colors.white, width: 2),
                                        checkColor: Colors.white,
                                        value: isCultural,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isCultural = value!;
                                          });
                                        }
                                    ),
                                    Text(
                                      "Cultural", style: TextStyle(
                                        fontFamily: "AdobeDevanagari",
                                        fontSize: 15,
                                        color: Colors.white
                                    ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
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

class ButtonComponent extends StatelessWidget {
  final IconData icon;
  final void Function() func;

  const ButtonComponent({Key? key, required this.icon, required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: func,
        splashColor: darkOrangeColor,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return orangeTwoColor;
            }
            return darkOrangeColor;
          }),
          shape: WidgetStateProperty.all<OutlinedBorder>(
              CircleBorder()
          ),
        ),
        icon: Icon(icon, color: Colors.white));
  }
}
