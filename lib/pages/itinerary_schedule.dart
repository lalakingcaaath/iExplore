import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/pages/coin_charge.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItinerarySchedule extends StatefulWidget {
  const ItinerarySchedule({Key? key}) : super(key: key);
  @override
  State<ItinerarySchedule> createState() => _ItineraryScheduleState();
}
final commentController = TextEditingController();

class _ItineraryScheduleState extends State<ItinerarySchedule> {
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
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "EXPLORE MANILA NOW", style: TextStyle(
                            fontFamily: 'FSP-Demo',
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white
                        ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                    ),
                    Container(
                      width: 350,
                      decoration: BoxDecoration(
                        color: brownColor,
                        border: Border.all(color: Colors.white)
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.bookmark, color: Colors.white),
                                Spacer(),
                                Text(
                                  "ITINERARY FOR TODAY", style: TextStyle(
                                    fontFamily: 'AdobeDevanagari',
                                    fontSize: 20,
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white,
                                    decorationThickness: 2
                                ),
                                ),
                                Spacer(),
                                GestureDetector(
                                    onTap: (){
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) => const CustomDialogWidget()
                                      );
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
                                "Click the places for more detailed information on directions, history, etc.", style: TextStyle(
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
                          Table(
                            defaultVerticalAlignment: TableCellVerticalAlignment.top,
                            border: TableBorder.all(color: Colors.white),
                            columnWidths: {
                              0: FixedColumnWidth(109),
                              1: FixedColumnWidth(120),
                              2: FixedColumnWidth(120)
                            },
                            children: [
                              TableRow(
                                  children: [
                                    TableCell(
                                        child: Center(
                                          child: Text(
                                            "TIME", style: TextStyle(
                                            fontFamily: 'AdobeDevanagari',
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                          ),
                                        )),
                                    TableCell(
                                        child: Center(
                                          child: Text(
                                            "PLACE", style: TextStyle(
                                            fontFamily: 'AdobeDevanagari',
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                          ),
                                        )),
                                    TableCell(
                                        child: Center(
                                          child: Text(
                                            "WHAT TO DO", style: TextStyle(
                                            fontFamily: 'AdobeDevanagari',
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                          ),
                                        )),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(
                                        child: Center(
                                          child: Text(
                                            "10:00 - 11:00", style: TextStyle(
                                            fontFamily: 'AdobeDevanagari',
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                          ),
                                        )),
                                    TableCell(
                                        child: Center(
                                          child: Text(
                                            "National Museum of Fine Arts", textAlign: TextAlign.center, style: TextStyle(
                                            fontFamily: 'AdobeDevanagari',
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                          ),
                                        )),
                                    TableCell(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "\u25CF Arts Sightseeing", style: TextStyle(
                                            fontFamily: 'AdobeDevanagari',
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                          ),
                                        )),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(
                                        child: Center(
                                          child: Text(
                                            "11:30 - 13:00", style: TextStyle(
                                            fontFamily: 'AdobeDevanagari',
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                          ),
                                        )),
                                    TableCell(
                                        child: Center(
                                          child: Text(
                                            "Casino Espanol de Manila", style: TextStyle(
                                            fontFamily: 'AdobeDevanagari',
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                          ),
                                        )),
                                    TableCell(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "\u25CF Lunch", style: TextStyle(
                                            fontFamily: 'AdobeDevanagari',
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                          ),
                                        )),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(
                                        child: Center(
                                          child: Text(
                                            "13:30 - 16:00", style: TextStyle(
                                            fontFamily: 'AdobeDevanagari',
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                          ),
                                        )),
                                    TableCell(
                                        child: Center(
                                          child: Text(
                                            "Intramuros", style: TextStyle(
                                            fontFamily: 'AdobeDevanagari',
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                          ),
                                        )),
                                    TableCell(
                                        child: Center(
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    "\u25CF San Agustin Church Visit", style: TextStyle(
                                                    fontFamily: 'AdobeDevanagari',
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    "\u25CF Bambike Tour", style: TextStyle(
                                                    fontFamily: 'AdobeDevanagari',
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    "\u25CF Casa Manila Visit", style: TextStyle(
                                                    fontFamily: 'AdobeDevanagari',
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    "\u25CF Kalesa Ride", style: TextStyle(
                                                    fontFamily: 'AdobeDevanagari',
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    "\u25CF Museo de Intramuros Visit", style: TextStyle(
                                                    fontFamily: 'AdobeDevanagari',
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                  ),
                                                ),
                                              ],
                                            )
                                        )),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(
                                        child: Center(
                                          child: Text(
                                            "16:00 - 17:00", style: TextStyle(
                                            fontFamily: 'AdobeDevanagari',
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                          ),
                                        )),
                                    TableCell(
                                        child: Center(
                                          child: Text(
                                            "Arroceros Forest", style: TextStyle(
                                            fontFamily: 'AdobeDevanagari',
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                          ),
                                        )),
                                    TableCell(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "\u25CF Forest Stroll", style: TextStyle(
                                            fontFamily: 'AdobeDevanagari',
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                          ),
                                        )),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(
                                        child: Center(
                                          child: Text(
                                            "17:00 - 19:00", style: TextStyle(
                                            fontFamily: 'AdobeDevanagari',
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                          ),
                                        )),
                                    TableCell(
                                        child: Center(
                                          child: Text(
                                            "Binondo Chinatown", style: TextStyle(
                                            fontFamily: 'AdobeDevanagari',
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                          ),
                                        )),
                                    TableCell(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "\u25CF Food Crawl / Dinner", style: TextStyle(
                                            fontFamily: 'AdobeDevanagari',
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                          ),
                                        )),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    TableCell(
                                        child: Center(
                                          child: Text(
                                            "19:00 - 20:00", style: TextStyle(
                                            fontFamily: 'AdobeDevanagari',
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                          ),
                                        )),
                                    TableCell(
                                        child: Center(
                                          child: Text(
                                            "Rizal Park", style: TextStyle(
                                            fontFamily: 'AdobeDevanagari',
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                          ),
                                        )),
                                    TableCell(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "\u25CF Night Stroll", style: TextStyle(
                                            fontFamily: 'AdobeDevanagari',
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                          ),
                                        )),
                                  ]
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 320,
                          height: 25,
                          decoration: BoxDecoration(
                              color: lightOrangeTwoColor,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(
                            child: Text(
                              "DONE EXPLORING? SHARE US YOUR REVIEW ON THIS ITINERARY!", style: TextStyle(
                              fontFamily: 'AdobeDevanagari',
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: darkOrangeColor,
                            ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          width: 300,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)
                          ),
                          child: Column(
                            children: [
                              TextField(
                                controller: commentController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Write your thoughts...',
                                  hintStyle: TextStyle(
                                    fontFamily: 'AdobeDevanagari',
                                    fontSize: 11,
                                    color: Colors.white
                                  )
                                ),
                                style: TextStyle(
                                    fontFamily: 'AdobeDevanagari',
                                    fontSize: 11,
                                    color: Colors.white
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      CollectionReference collRef = FirebaseFirestore.instance.collection('comments');
                                      collRef.add({
                                        'comment': commentController
                                      });
                                    },
                                    child: Text(
                                      "Add review", style: TextStyle(
                                        fontFamily: 'AdobeDevanagari',
                                        fontSize: 11,
                                        color: Colors.white
                                    ),
                                    )
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: RatingBar.builder(
                                        initialRating: 0,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 24,
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        }
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 50),
                          child: Text(
                            "OTHER USER REVIEWS", style: TextStyle(
                              fontFamily: 'FSP-Demo',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.white
                          ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: brownColor
                          ),
                        )
                      ],
                    )
                  ],
                );
              }
            )
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingButtonNavBarComponent(),
        bottomNavigationBar: BottomNavigationBarComponent()
      ),
    );
  }
}

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({Key? key}) : super(key: key);

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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => iCoins()));
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



