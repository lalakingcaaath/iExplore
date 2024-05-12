import 'package:flutter/material.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/utils/colors.dart';

class PacoPark extends StatefulWidget {
  const PacoPark({Key? key}) : super(key: key);

  @override
  State<PacoPark> createState() => _PacoParkState();
}

class _PacoParkState extends State<PacoPark> {
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
        appBar: HeaderAppBarComponent(headerTitle: 'Ecotourism'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Paco Park", style: TextStyle(
                          fontFamily: 'FSP-Demo',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white
                      ),
                      ),
                    )
                  ]
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 325,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage("images/category_images/ECOTOURISM/Paco Park.jpg"),
                            fit: BoxFit.fill
                        )
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 325,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white12,
                        border: Border.all(color: Colors.white)
                    ),
                    child: Center(
                      child: Text(
                        "GENERATE\n"
                            "INFORMATION FROM\n"
                            "GOOGLE", textAlign: TextAlign.center, style: TextStyle(
                          color: Colors.white,
                          fontFamily: "AdobeDevanagari",
                          fontWeight: FontWeight.bold,
                          fontSize: 25
                      ),
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
