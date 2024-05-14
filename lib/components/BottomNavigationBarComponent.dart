import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/utils/colors.dart';

// Bottom Navigation Bar for all pages EXCEPT login and register

class BottomNavigationBarComponent extends StatelessWidget {
  const BottomNavigationBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BottomNavigationBar(
        backgroundColor: lightOrangeColor,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SizedBox(
                child: Transform.scale(
              scale: 1.5,
              child: GestureDetector(
                onTap: () {
                  context.go('/favorite');
                },
                  child: const Icon(Icons.favorite)
              ),
            )),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: SizedBox(
                width: 25,
                height: 25,
                child: Transform.scale(
                  scale: 1.5,
                  child: GestureDetector(
                    onTap: () {
                      context.go('/day_select');
                    },
                    child: Image.asset(
                        "images/AI-transparent.png", fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              label: ""),
          const BottomNavigationBarItem(
            icon: Icon(null),
            label: "HOME",
          ),
          BottomNavigationBarItem(
              icon: SizedBox(
                child: Transform.scale(
                  scale: 1.5,
                  child: GestureDetector(
                    onTap: () {
                      context.go('/downloads');
                    },
                      child: const Icon(Icons.download)
                  ),
                ),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: SizedBox(
                child: Transform.scale(
                  scale: 1.5,
                  child: GestureDetector(
                      onTap: () {
                        context.go('/profile');
                      },
                      child: const Icon(Icons.person_2_outlined)),
                ),
              ),
              label: ""),
        ],
        unselectedLabelStyle: TextStyle(
            fontFamily: "Fontspring-Demo",
            fontWeight: FontWeight.bold,
            color: orangeThreeColor,
            fontSize: 10
        ),
        unselectedItemColor: darkOrangeColor,
        selectedItemColor: darkOrangeColor,
      ),
    ]);
  }
}
