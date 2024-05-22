import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:i_explore/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:typethis/typethis.dart';

class DaySelect extends StatefulWidget {
  @override
  State<DaySelect> createState() => _DaySelectState();
}

class _DaySelectState extends State<DaySelect> {
  String? _name;

  @override
  void initState() {
    super.initState();
    AuthService authService = Provider.of<AuthService>(context, listen: false);
    _name = authService.user?.displayName;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [orangeOneColor, orangeTwoColor, orangeThreeColor],
        )),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: HeaderAppBarComponent(
              headerTitle: 'DigiCompanion',
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TypeThis(
                          string: "READY TO EXPLORE IN ONE CLICK?\n"
                              "IN WHAT WAYS DO YOU WANT TO\n CUSTOMIZE YOUR ITINERARIES?", textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'FSP-Demo',
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.white
                          ),
                          speed: 150,
                          showBlinkingCursor: false,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => context.push("/day_itinerary"),
                          child: Container(
                            width: 200,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: brownColor
                            ),
                            child: Center(
                              child: Text(
                                "DAY", style: TextStyle(
                                color: Colors.white,
                                fontFamily: "AdobeDevanagari",
                                fontSize: 20
                              ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => context.push("/time_select"),
                          child: Container(
                            width: 200,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: brownColor
                            ),
                            child: Center(
                              child: Text(
                                "TIME", style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "AdobeDevanagari",
                                  fontSize: 20
                              ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
              ])
            )
        ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingButtonNavBarComponent(),
            bottomNavigationBar: BottomNavigationBarComponent()
        ));
  }
}