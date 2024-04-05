import 'package:flutter/material.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/components/ImageCircleComponent.dart';
import 'package:i_explore/utils/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderAppBarComponent(headerTitle: 'Home dashboard'),
      body: SingleChildScrollView(
          child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              orangeOneColor,
              orangeTwoColor,
              orangeThreeColor
            ], // Define your gradient colors
            begin: Alignment.topCenter, // Define the gradient start point
            end: Alignment.bottomCenter, // Define the gradient end point
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  decoration: BoxDecoration(
                      color: lightOrangeColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Which Island do you want to explore?",
                    style: TextStyle(
                        color: orangeTwoColor,
                        fontFamily: 'AdobeDevanagari',
                        fontStyle: FontStyle.italic,
                        fontSize: 20),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageCircleComponent(
                  desc: 'luzon',
                  imageUrl: 'images/luzon.jpg',
                ),
                ImageCircleComponent(
                    imageUrl: 'images/visayas.jpg', desc: 'visayas'),
                ImageCircleComponent(
                  imageUrl: 'images/mindanao.jpg',
                  desc: 'Mindanao',
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
            ),
            Container(
              color: lightOrangeColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "TOUR CATEGORIES",
                    style: TextStyle(
                      color: orangeTwoColor,
                      fontSize: 20,
                      fontFamily: 'AdobeDevanagari',
                      fontStyle: FontStyle.italic,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                ),
                Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: Container(
                        color: brownColor,
                        child: const Center(
                          child: Text(
                            "CULINARY",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'AdobeDevanagari',
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
                Container(
                  width: 40,
                ),
                Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: Container(
                        color: brownColor,
                        child: const Center(
                          child: Text(
                            "ECOTOURISM",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'AdobeDevanagari',
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
                Container(
                  width: 40,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                ),
                Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: Container(
                        color: brownColor,
                        child: const Center(
                          child: Text(
                            "ADVENTURE",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'AdobeDevanagari',
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
                Container(
                  width: 40,
                ),
                Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: Container(
                        color: brownColor,
                        child: const Center(
                          child: Text(
                            "PILGRIMAGE",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'AdobeDevanagari',
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
                Container(
                  width: 40,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                ),
                Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: Container(
                        color: brownColor,
                        child: const Center(
                          child: Text(
                            "LEISURE",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'AdobeDevanagari',
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
                Container(
                  width: 40,
                ),
                Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: Container(
                        color: brownColor,
                        child: const Center(
                          child: Text(
                            "RURAL",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'AdobeDevanagari',
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
                Container(
                  width: 40,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                ),
                Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: Container(
                        color: brownColor,
                        child: const Center(
                          child: Text(
                            "CULTURAL",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'AdobeDevanagari',
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
                Container(
                  width: 40,
                ),
                Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: Container(
                        color: brownColor,
                        child: const Center(
                          child: Text(
                            "WELLNESS",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'AdobeDevanagari',
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
                Container(
                  width: 40,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
            ),
            Container(
              color: lightOrangeColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SUGGESTED ITINERARIES",
                    style: TextStyle(
                        color: orangeTwoColor,
                        fontFamily: 'AdobeDevanagari',
                        fontStyle: FontStyle.italic,
                        fontSize: 20),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                ),
                Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: Container(
                        color: brownColor,
                        child: const Center(
                          child: Text(
                            "MANILA CITY",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )),
                Container(
                  width: 40,
                ),
                Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: Container(
                        color: brownColor,
                        child: const Center(
                          child: Text(
                            "BAGUIO CITY",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )),
                Container(
                  width: 40,
                ),
              ],
            ),
          ],
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 50,
        width: 50,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const MyHomePage(title: "iExplore")));
            },
            child: Transform.scale(
              scale: 1.275,
              child: Image.asset('images/iexplore-logo-circle.png'),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
              label: ""),
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
              label: ""),
          BottomNavigationBarItem(
              icon: SizedBox(
                child: Transform.scale(
                  scale: 1.5,
                  child: const Icon(Icons.person_2_outlined),
                ),
              ),
              label: ""),
        ],
        unselectedLabelStyle: TextStyle(
            fontFamily: "Fontspring-Demo",
            fontWeight: FontWeight.bold,
            color: orangeThreeColor),
        unselectedItemColor: darkOrangeColor,
        selectedItemColor: darkOrangeColor,
      ),
    );
  }
}
