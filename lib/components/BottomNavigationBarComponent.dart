import 'package:flutter/material.dart';
import 'package:i_explore/pages/profile.dart';
import 'package:i_explore/utils/colors.dart';

// Bottom Navigation Bar for all pages EXCEPT login and register

class BottomNavigationBarComponent extends StatelessWidget {
  const BottomNavigationBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BottomNavigationBar(
          backgroundColor: lightOrangeColor,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SizedBox(
                  child: Transform.scale(
                    scale: 1.5,
                    child: const Icon(Icons.bookmark),
                  )),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: SizedBox(
                  child: Transform.scale(
                    scale: 1.5,
                    child: const Icon(Icons.search),
                  ),
                ),
                label: ""
            ),
            const BottomNavigationBarItem(
              icon: Icon(null),
              label: "DASHBOARD",
            ),
            BottomNavigationBarItem(
                icon: SizedBox(
                  child: Transform.scale(
                    scale: 1.5,
                    child: const Icon(Icons.download),
                  ),
                ),
                label: ""
            ),
            BottomNavigationBarItem(
                icon: SizedBox(
                  child: Transform.scale(
                    scale: 1.5,
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                        },
                        child: const Icon(Icons.person_2_outlined)),
                  ),
                ),
                label: ""
            ),
          ],
          unselectedLabelStyle: TextStyle(
              fontFamily: "Fontspring-Demo",
              fontWeight: FontWeight.bold,
              color: orangeThreeColor),
          unselectedItemColor: darkOrangeColor,
          selectedItemColor: darkOrangeColor,
        ),
      ]);
  }

}
