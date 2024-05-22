import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:i_explore/services/auth_service.dart';
import 'package:provider/provider.dart';

class TimeItinerary extends StatefulWidget {
  const TimeItinerary({super.key});

  @override
  State<TimeItinerary> createState() => _TimeItineraryState();
}

class _TimeItineraryState extends State<TimeItinerary> {
  String? _name;
  int hour = 1;
  bool isHidden = false;

  @override
  void initState() {
    super.initState();
    AuthService authService = Provider.of<AuthService>(context, listen: false);
    _name = authService.user?.displayName;
  }

  void dayIncrement() {
    setState(() {
      hour++;
    });
  }

  void dayDecrement() {
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
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: HeaderAppBarComponent(headerTitle: "DigiCompanion"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hi $_name',
                    style: TextStyle(
                        fontFamily: 'FSP-Demo',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  Text(
                    "!", style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
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
                  Text(
                    "YOU HAVE NOW SELECTED THE TIME\n"
                        "HOW MANY HOURS WILL YOU EXPLORE?",
                    style: TextStyle(
                        fontFamily: 'FSP-Demo',
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 64,
                      width: 198,
                      decoration: BoxDecoration(
                          color: brownColor,
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: hour > 1
                          ? Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonComponent(
                            icon: Icons.remove,
                            func: dayDecrement,
                          ),
                          Text(
                            "$hour HOUR",
                            style: TextStyle(
                                fontFamily: 'AdobeDevanagari',
                                fontStyle: FontStyle.italic,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          ButtonComponent(
                              icon: Icons.add, func: dayIncrement),
                        ],
                      )
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "$hour HOUR",
                              style: TextStyle(
                                  fontFamily: 'AdobeDevanagari',
                                  fontStyle: FontStyle.italic,
                                  fontSize: 20,
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
                  )
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                    decoration: BoxDecoration(
                        color: brownColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () => context.push("/manila_itinerary"),
                        child: Text(
                          "SAVE AND GENERATE NOW",
                          style: TextStyle(
                              fontFamily: 'AdobeDevanagari',
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
