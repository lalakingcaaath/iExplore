import 'dart:math';

import 'package:flutter/material.dart';
import 'package:i_explore/components/ImageCircleComponent.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/services/auth_service.dart';
import 'package:provider/provider.dart';

class Introductory_Screen extends StatefulWidget {
  const Introductory_Screen({Key? key}) : super(key: key);

  @override
  State<Introductory_Screen> createState() => _Introductory_ScreenState();
}

class _Introductory_ScreenState extends State<Introductory_Screen> with SingleTickerProviderStateMixin {
  late AnimationController _logoController;
  String? _name;
  int _currentPage = 0;

  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    AuthService authService = Provider.of<AuthService>(context, listen: false);
    _name = authService.user?.displayName;

    setState(() {
      _name = authService.user?.displayName;
    });

    _logoController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _logoController.dispose();
    super.dispose();
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
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  itemCount: 3,
                  controller: _controller,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return _introPage1(context, _name, _logoController);
                    } else if (index == 1) {
                      return _introPage2(context, _name);
                    } else {
                      return _introPage3(context, _name);
                    }
                  },
                physics: PageScrollPhysics(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  _introIndicator(context, _currentPage ,i)
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget _introIndicator(BuildContext, int _currentPage,int index) {
  return Container(
    margin: const EdgeInsets.only(bottom: 60),
    child: Container(
      margin: EdgeInsets.all(5),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? brownColor : Colors.white,
        border: Border.all(color: Colors.white)
      )
    ),
  );
}

Widget _introPage1(BuildContext context, String? _name, AnimationController _logoController)  {
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => context.push('/home'),
                  child: Text(
                    "Skip", style: TextStyle(
                      color: Colors.white,
                      fontFamily: "FSP-Demo",
                      fontSize: 20
                  ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 30,
          ),
          AnimatedBuilder(
            animation: _logoController,
            builder: (BuildContext, Widget? child) {
              double rotationAngle = Tween<double>(
                begin: 0,
                end: pi,
              ).transform(_logoController.value);
                  return Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(rotationAngle),
                child: Image.asset(
                'images/iexplore-logo.png', width: 150, height: 150,
              ));
            }
          ),
          Container(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "YOUR EXPLORER COMPANION", style: TextStyle(
                  color: Colors.white,
                  fontFamily: "FSP-Demo",
                  fontSize: 20
              ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hi $_name", style: TextStyle(
                  color: Colors.white,
                  fontFamily: "FSP-Demo",
                  fontSize: 20
              ),
              ),
              Text(
                "!", style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
              )
            ],
          )
        ],
      ),
    )
  );
}

Widget _introPage2(BuildContext context, String? _name) {
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => context.push('/home'),
                  child: Text(
                    "Skip", style: TextStyle(
                      color: Colors.white,
                      fontFamily: "FSP-Demo",
                      fontSize: 20
                  ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(
                  "Hi $_name", style: TextStyle(
                    color: Colors.white,
                    fontFamily: "FSP-Demo",
                    fontSize: 20
                ),
                ),
              ),
              Text(
                "!", style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
              )
            ],
          ),
          Container(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/iexplore-logo.png', width: 100, height: 100,
              ),
            ],
          ),
          Container(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to iExplorer PH,\n"
                    "your ultimate digital tourist guide\n"
                    "mobile application.", textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "FSP-Demo",
                    fontSize: 17
                ),
              )
            ],
          ),
          Container(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "FSP-Demo",
                      fontSize: 17
                    ),
                    children: <TextSpan> [
                      TextSpan(
                        text: "Get ready for a fascinating journey\n"
                            "as iExplorer PH suggests exciting\n"
                            "itineraries and amazing features,\n"
                      ),
                      TextSpan(
                        text: "all in just one click", style: TextStyle(
                        fontWeight: FontWeight.bold
                      )
                      )
                    ]
                  ),
              )
            ],
          )
        ],
      ),
    )
  );
}

Widget _introPage3(BuildContext context, String? _name) {
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
      body: Column(
        children: [
          Container(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hi $_name", style: TextStyle(
                  color: Colors.white,
                  fontFamily: "FSP-Demo",
                  fontSize: 20
              ),
              ),
              Text(
                "!", style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
              )
            ],
          ),
          Container(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImageCircleComponent(imageUrl: 'images/luzon.jpg', desc: 'Luzon'),
              ImageCircleComponent(imageUrl: 'images/visayas.jpg', desc: 'Visayas'),
              ImageCircleComponent(imageUrl: 'images/mindanao.jpg', desc: 'Mindanao')
            ],
          ),
          Container(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "FSP-Demo",
                          fontSize: 17
                      ),
                      children: <TextSpan> [
                        TextSpan(
                            text: "Indulge yourself in the beauty and\n"
                                "riches of the Philippine culture through\n"
                        ),
                        TextSpan(
                            text: "iExplorer PH", style: TextStyle(
                            fontWeight: FontWeight.bold
                        )
                        )
                      ]
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Are you ready to start exploring?", style: TextStyle(
                  color: Colors.white,
                  fontFamily: "AdobeDevanagari",
                  fontSize: 20
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
                onTap: () => context.push("/manila_itinerary"),
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Center(
                    child: Text(
                      "GENERATE NOW!", style: TextStyle(
                        color: Colors.white,
                        fontFamily: "AdobeDevanagari",
                        fontSize: 20,
                        letterSpacing: 5
                    ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => context.push('/home'),
                child: Text(
                  "FOR LATER", style: TextStyle(
                  color: Colors.white,
                  fontFamily: "AdobeDevanagari",
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white
                ),
                ),
              )
            ],
          )
        ],
      ),
    )
  );
}