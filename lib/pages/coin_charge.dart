import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/provider/coin_provider.dart';
import 'package:i_explore/services/firestore_service.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:provider/provider.dart';

class iCoins extends StatefulWidget {
  const iCoins({Key? key}) : super(key: key);

  @override
  State<iCoins> createState() => _iCoinsState();
}

class _iCoinsState extends State<iCoins> {
  void addCoins(int coinValue) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'Alert!',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'FSP-AdobeDevanagari',
                  fontWeight: FontWeight.w800,
                ),
              ),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/iexplore-coin-2.png',
                    scale: 4,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Buy ${coinValue} coins?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text('Close')),
                ElevatedButton(
                    onPressed: () {
                      // after adding coin
                      FirestoreService().addSampleCoins(coinValue);
                      // then reload the coin value
                      Provider.of<CoinProvider>(context, listen: false)
                          .fetchCoinData();

                      // TO:DO add something snackbar and payment method.
                      context.pop();
                    },
                    child: Text('Buy')),
              ],
            ));
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
        appBar: HeaderAppBarComponent(headerTitle: "iExplore Coins"),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "COIN CHARGING",
                        style: TextStyle(
                            fontFamily: 'FSP-Demo',
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white),
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
                      height: 65,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: lightOrangeColor),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.asset('images/iexplore-coin.png'),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "1",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: "AdobeDevanagari",
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: brownColor),
                              ),
                              Text(
                                "Free iExplore Coins Charge \nWatch Maximum 5 ads per day",
                                style: TextStyle(
                                    fontFamily: "AdobeDevanagari",
                                    fontSize: 10,
                                    color: brownColor),
                              )
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.only(right: 5),
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: darkOrangeColor),
                              child: Center(
                                child: Text(
                                  "Watch Ad",
                                  style: TextStyle(
                                      fontFamily: "AdobeDevanagari",
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
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
                      height: 65,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: lightOrangeColor),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.asset('images/iexplore-coin-2.png'),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "6",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: "AdobeDevanagari",
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: brownColor),
                              ),
                              Text(
                                "iExplore Coin Bonus!",
                                style: TextStyle(
                                    fontFamily: "AdobeDevanagari",
                                    fontSize: 16,
                                    color: brownColor),
                              )
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              addCoins(6);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 5),
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: darkOrangeColor),
                              child: Center(
                                child: Text(
                                  "PHP 20",
                                  style: TextStyle(
                                      fontFamily: "AdobeDevanagari",
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
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
                      height: 65,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: lightOrangeColor),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.asset('images/iexplore-coin-3.png'),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "15",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: "AdobeDevanagari",
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: brownColor),
                              ),
                              Text(
                                "iExplore Coin Bonus!",
                                style: TextStyle(
                                    fontFamily: "AdobeDevanagari",
                                    fontSize: 16,
                                    color: brownColor),
                              )
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              addCoins(15);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 5),
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: darkOrangeColor),
                              child: Center(
                                child: Text(
                                  "PHP 50",
                                  style: TextStyle(
                                      fontFamily: "AdobeDevanagari",
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
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
                      height: 65,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: lightOrangeColor),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.asset('images/iexplore-coin-3.png'),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "20",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: "AdobeDevanagari",
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: brownColor),
                              ),
                              Text(
                                "iExplore Coin Bonus!",
                                style: TextStyle(
                                    fontFamily: "AdobeDevanagari",
                                    fontSize: 16,
                                    color: brownColor),
                              )
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              addCoins(20);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 5),
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: darkOrangeColor),
                              child: Center(
                                child: Text(
                                  "PHP 70",
                                  style: TextStyle(
                                      fontFamily: "AdobeDevanagari",
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
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
                      height: 65,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: lightOrangeColor),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.asset('images/iexplore-coin-3.png'),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "30",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: "AdobeDevanagari",
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: brownColor),
                              ),
                              Text(
                                "iExplore Coin Bonus!",
                                style: TextStyle(
                                    fontFamily: "AdobeDevanagari",
                                    fontSize: 16,
                                    color: brownColor),
                              )
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              addCoins(30);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 5),
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: darkOrangeColor),
                              child: Center(
                                child: Text(
                                  "PHP 110",
                                  style: TextStyle(
                                      fontFamily: "AdobeDevanagari",
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
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
                      height: 65,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: lightOrangeColor),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.asset('images/iexplore-coin-3.png'),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "40",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: "AdobeDevanagari",
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: brownColor),
                              ),
                              Text(
                                "iExplore Coin Bonus!",
                                style: TextStyle(
                                    fontFamily: "AdobeDevanagari",
                                    fontSize: 16,
                                    color: brownColor),
                              )
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              addCoins(40);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 5),
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: darkOrangeColor),
                              child: Center(
                                child: Text(
                                  "PHP 150",
                                  style: TextStyle(
                                      fontFamily: "AdobeDevanagari",
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
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
                      height: 65,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: lightOrangeColor),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.asset('images/iexplore-coin-3.png'),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "60",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: "AdobeDevanagari",
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: brownColor),
                              ),
                              Text(
                                "iExplore Coin Bonus!",
                                style: TextStyle(
                                    fontFamily: "AdobeDevanagari",
                                    fontSize: 16,
                                    color: brownColor),
                              )
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.only(right: 5),
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: darkOrangeColor),
                              child: Center(
                                child: Text(
                                  "PHP 200",
                                  style: TextStyle(
                                      fontFamily: "AdobeDevanagari",
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(margin: const EdgeInsets.only(top: 15))
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
