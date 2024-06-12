// ! Copied from manila_itinerary.dart -> subject to be deleted

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/MapComponent.dart';
import 'package:i_explore/model/itinerary_model.dart';
import 'package:i_explore/provider/itinerary_provider.dart';
import 'package:i_explore/services/firestore_service.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:i_explore/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:i_explore/pages/coin_charge.dart';

class Itinerary_Table extends StatefulWidget {
  const Itinerary_Table({Key? key}) : super(key: key);

  @override
  State<Itinerary_Table> createState() => _Itinerary_TableState();
}

class _Itinerary_TableState extends State<Itinerary_Table> {
  String? _name;
  Itinerary? itinerary;

  @override
  void initState() {
    super.initState();
    // requestLocationPermission();

    AuthService authService = Provider.of<AuthService>(context, listen: false);
    _name = authService.user?.displayName;

    setState(() {
      _name = authService.user?.displayName;
    });

    itinerary =
        Provider.of<ItineraryProvider>(context, listen: false).itineraryVal;
  }

  Future<void> requestLocationPermission() async {
    PermissionStatus status = await Permission.locationWhenInUse.request();
    if (status.isGranted) {
      //Location permission granted, proceed with using location
    } else if (status.isDenied) {
      //Location permission denied by user
      //Logic goes here
    }
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
          appBar: HeaderAppBarComponent(headerTitle: 'DigiCompanion'),
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
                        "Hi $_name",
                        style: TextStyle(
                            fontFamily: 'FSP-Demo',
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Text(
                        "!",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MapComponent(),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor),
                        child: Center(
                          child: Text(
                            "YOUR ${itinerary?.duration} HOURS SUGGESTED ITINERARY",
                            style: TextStyle(
                                fontFamily: 'FSP-Demo',
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                        color: brownColor,
                        border: Border.all(color: Colors.white)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.favorite, color: Colors.white),
                              Spacer(),
                              Text(
                                "ITINERARY FOR TODAY",
                                style: TextStyle(
                                    fontFamily: 'AdobeDevanagari',
                                    fontSize: 20,
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white,
                                    decorationThickness: 2),
                              ),
                              Spacer(),
                              GestureDetector(
                                  onTap: () async {
                                    var toJson = itinerary?.toJson();
                                    print(toJson);
                                    FirestoreService().saveItinenary(toJson!);
                                  },
                                  child: Icon(
                                      Icons.download_for_offline_outlined,
                                      color: Colors.white)),
                              Container(
                                margin: const EdgeInsets.only(top: 15),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Budget: PHP ${itinerary?.budget}",
                              style: TextStyle(
                                fontFamily: 'AdobeDevanagari',
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                color: lightOrangeTwoColor,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Click the places for more detailed information on directions, history, etc.",
                              style: TextStyle(
                                fontFamily: 'AdobeDevanagari',
                                fontStyle: FontStyle.italic,
                                fontSize: 11,
                                color: lightOrangeTwoColor,
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                        ),
                        ...itinerary!.activities
                            .map((acts) => buildItineraryTable(acts))
                            .toList()
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => context.push("/chat"),
                        child: Container(
                          width: 300,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: brownColor),
                          child: Center(
                            child: Text(
                              "CHAT WITH AI",
                              style: TextStyle(
                                  fontFamily: 'FSP-Demo',
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 34),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingButtonNavBarComponent(),
          bottomNavigationBar: BottomNavigationBarComponent()),
    );
  }
}

class CustomDialogWidget extends StatefulWidget {
  const CustomDialogWidget({Key? key}) : super(key: key);

  @override
  State<CustomDialogWidget> createState() => _CustomDialogWidgetState();
}

class _CustomDialogWidgetState extends State<CustomDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: orangeFourColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Download Itinerary Offline",
                          style: TextStyle(
                            fontFamily: 'AdobeDevanagari',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 1.0,
                      top: 0.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.red,
                          child: Icon(Icons.close, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Offline Access to Places Information",
                      style: TextStyle(
                        fontFamily: 'AdobeDevanagari',
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                        color: lightOrangeTwoColor,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: lightOrangeTwoColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Center(
                            child: Text(
                              "10",
                              style: TextStyle(
                                fontFamily: "AdobeDevanagari",
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: brownColor,
                              ),
                            ),
                          ),
                          Center(
                            child: Image.asset('images/iexplore-coin.png'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => iCoins()));
                      },
                      child: Container(
                        width: 170,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: lightOrangeTwoColor,
                        ),
                        child: Center(
                          child: Text(
                            "Not Enough iExplore Coins? Buy now",
                            style: TextStyle(
                              fontFamily: 'AdobeDevanagari',
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: darkOrangeColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildItineraryTable(Activity activity) {
  return Column(
    children: [
      SizedBox(
        height: 8.0,
      ),
      Text('Day: ${activity.day}',
          style: TextStyle(
              fontFamily: 'AdobeDevanagari',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white)),
      SizedBox(
        height: 8.0,
      ),
      Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.top,
        border: TableBorder.all(color: Colors.white),
        columnWidths: {
          0: FixedColumnWidth(109),
          1: FixedColumnWidth(120),
          2: FixedColumnWidth(120)
        },
        children: [
          TableRow(children: [
            TableCell(
                child: Center(
              child: Text(
                "TIME",
                style: TextStyle(
                  fontFamily: 'AdobeDevanagari',
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            )),
            TableCell(
                child: Center(
              child: Text(
                "PLACE",
                style: TextStyle(
                  fontFamily: 'AdobeDevanagari',
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            )),
            TableCell(
                child: Center(
              child: Text(
                "WHAT TO DO",
                style: TextStyle(
                  fontFamily: 'AdobeDevanagari',
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            )),
          ]),
          ...activity.activity
              .map((activityDetail) => buildActivityDetailRow(activityDetail))
              .toList()
        ],
      ),
    ],
  );
}

TableRow buildActivityDetailRow(ActivityDetail details) {
  return TableRow(children: [
    TableCell(
        child: Center(
      child: Text(
        details.time.trim(),
        style: TextStyle(
          fontFamily: 'AdobeDevanagari',
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    )),
    TableCell(
        child: Center(
            child: Text(details.location.trim(),
                style: TextStyle(
                  fontFamily: 'AdobeDevanagari',
                  fontSize: 16,
                  color: Colors.white,
                )))),
    TableCell(
        child: Text(
      details.whatToDo.trim(),
      style: TextStyle(
        fontFamily: 'AdobeDevanagari',
        fontSize: 16,
        color: Colors.white,
      ),
    )),
  ]);
}
