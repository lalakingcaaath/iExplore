import 'package:flutter/material.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/utils/colors.dart';

class Schools extends StatelessWidget {
  const Schools({Key? key}) : super(key: key);

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
        appBar: HeaderAppBarComponent(headerTitle: "School Tours"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "UAAP SCHOOLS", style: TextStyle(
                    color: Colors.white,
                    fontFamily: "FSP-Demo",
                    fontSize: 20,
                  ),
                  )
                ],
              ),
              Container(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/category_images/SCHOOL_LOGO/Adamson University.jpg"),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/category_images/SCHOOL_LOGO/Ateneo De Manila University.png"),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/category_images/SCHOOL_LOGO/De La Salle University.png"),
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/category_images/SCHOOL_LOGO/Far_Easter_University_Logo.svg.png"),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/category_images/SCHOOL_LOGO/National University.png"),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/category_images/SCHOOL_LOGO/University of Santo Tomas.png"),
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/category_images/SCHOOL_LOGO/University of the East.png"),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/category_images/SCHOOL_LOGO/University of the Philippines Diliman.png"),
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "NCAA SCHOOLS", style: TextStyle(
                    color: Colors.white,
                    fontFamily: "FSP-Demo",
                    fontSize: 20,
                  ),
                  )
                ],
              ),
              Container(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/category_images/SCHOOL_LOGO/Colegio de San Juan de Letran.png"),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/category_images/SCHOOL_LOGO/De La Salle-College of Saint Benilde.png"),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/category_images/SCHOOL_LOGO/Jose Rizal University.png"),
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/category_images/SCHOOL_LOGO/Mapúa University.png"),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/category_images/SCHOOL_LOGO/San Beda University.png"),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/category_images/SCHOOL_LOGO/San Sebastian College – Recoletos.png"),
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/category_images/SCHOOL_LOGO/University of Perpetual Help System DALTA.png"),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/category_images/SCHOOL_LOGO/Lyceum of the Philippines University.png"),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/category_images/SCHOOL_LOGO/Emilio Aguinaldo College.png"),
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "STATE UNIVERSITY", style: TextStyle(
                    color: Colors.white,
                    fontFamily: "FSP-Demo",
                    fontSize: 20,
                  ),
                  )
                ],
              ),
              Container(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/category_images/SCHOOL_LOGO/Polytechnic University of the Philippines.png"),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/category_images/SCHOOL_LOGO/Philippine Normal University.png"),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("images/category_images/SCHOOL_LOGO/Technological University of the Philippines.png"),
                  ),
                ],
              ),
              Container(
                height: 20,
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
