import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/utils/colors.dart';

class Hotels extends StatelessWidget {
  const Hotels({Key? key}) : super(key: key);

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
          appBar: HeaderAppBarComponent(headerTitle: "Hotels"),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => context.push("/generate"),
                      child: Container(
                        width: 250,
                        decoration: BoxDecoration(
                            color: lightOrangeColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("images/AI-transparent.png",
                                width: 40, color: Colors.black),
                            Text(
                              "Generate an Itinerary now!",
                              style: TextStyle(
                                  fontFamily: "AdobeDevanagari",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.only(left: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "NEARBY HOTELS",
                            style: TextStyle(
                                fontFamily: 'FSP-Demo',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => context.push("/gohotel"),
                          child: Container(
                            width: 350,
                            height: 75,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "images/category_images/HOTELS/Go Hotels Ermita.jpg"),
                                    fit: BoxFit.fill,
                                    opacity: 0.5),
                                borderRadius: BorderRadius.circular(10),
                                color: brownColor),
                            child: Center(
                              child: Text(
                                "Go Hotels Ermita",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "AdobeDevanagari",
                                    fontSize: 20),
                              ),
                            ),
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
                          onTap: () => context.push("/hotelh20"),
                          child: Container(
                            width: 350,
                            height: 75,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "images/category_images/HOTELS/Hotel H20.jpg"),
                                    fit: BoxFit.fill,
                                    opacity: 0.5),
                                borderRadius: BorderRadius.circular(10),
                                color: brownColor),
                            child: Center(
                              child: Text(
                                "Hotel H20",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "AdobeDevanagari",
                                    fontSize: 20),
                              ),
                            ),
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
                          onTap: () => context.push("/lotushotel"),
                          child: Container(
                            width: 350,
                            height: 75,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "images/category_images/HOTELS/Manila Lotus Hotel.jpg"),
                                    fit: BoxFit.fill,
                                    opacity: 0.5),
                                borderRadius: BorderRadius.circular(10),
                                color: brownColor),
                            child: Center(
                              child: Text(
                                "Manila Lotus Hotel",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "AdobeDevanagari",
                                    fontSize: 20),
                              ),
                            ),
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
                          onTap: () => context.push("/manilaprince"),
                          child: Container(
                            width: 350,
                            height: 75,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "images/category_images/HOTELS/Manila Prince.jpg"),
                                    fit: BoxFit.fill,
                                    opacity: 0.5),
                                borderRadius: BorderRadius.circular(10),
                                color: brownColor),
                            child: Center(
                              child: Text(
                                "Manila Prince",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "AdobeDevanagari",
                                    fontSize: 20),
                              ),
                            ),
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
                          onTap: () => context.push("/rphotel"),
                          child: Container(
                            width: 350,
                            height: 75,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "images/category_images/HOTELS/Rizal Park Hotel.jpg"),
                                    fit: BoxFit.fill,
                                    opacity: 0.5),
                                borderRadius: BorderRadius.circular(10),
                                color: brownColor),
                            child: Center(
                              child: Text(
                                "Rizal Park Hotel",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "AdobeDevanagari",
                                    fontSize: 20),
                              ),
                            ),
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
                          onTap: () => context.push("/shangrila"),
                          child: Container(
                            width: 350,
                            height: 75,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "images/category_images/HOTELS/Shangri-La The Fort, Manila.jpg"),
                                    fit: BoxFit.fill,
                                    opacity: 0.5),
                                borderRadius: BorderRadius.circular(10),
                                color: brownColor),
                            child: Center(
                              child: Text(
                                "Shangri-La The Fort, Manila",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "AdobeDevanagari",
                                    fontSize: 20),
                              ),
                            ),
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
                          onTap: () => context.push("/bayleaf"),
                          child: Container(
                            width: 350,
                            height: 75,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "images/category_images/HOTELS/The Bayleaf Intramuros Hotel.jpg"),
                                    fit: BoxFit.fill,
                                    opacity: 0.5),
                                borderRadius: BorderRadius.circular(10),
                                color: brownColor),
                            child: Center(
                              child: Text(
                                "The Bayleaf Intramuros Hotel",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "AdobeDevanagari",
                                    fontSize: 20),
                              ),
                            ),
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
                          onTap: () => context.push("/peninsula"),
                          child: Container(
                            width: 350,
                            height: 75,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "images/category_images/HOTELS/The Peninsula Manila.jpg"),
                                    fit: BoxFit.fill,
                                    opacity: 0.5),
                                borderRadius: BorderRadius.circular(10),
                                color: brownColor),
                            child: Center(
                              child: Text(
                                "The Peninsula Manila",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "AdobeDevanagari",
                                    fontSize: 20),
                              ),
                            ),
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
                          onTap: () => context.push("/torre"),
                          child: Container(
                            width: 350,
                            height: 75,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "images/category_images/HOTELS/Torre De Manila.png"),
                                    fit: BoxFit.fill,
                                    opacity: 0.5),
                                borderRadius: BorderRadius.circular(10),
                                color: brownColor),
                            child: Center(
                              child: Text(
                                "Torre De Manila",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "AdobeDevanagari",
                                    fontSize: 20),
                              ),
                            ),
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
                          onTap: () => context.push("/wkhotel"),
                          child: Container(
                            width: 350,
                            height: 75,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "images/category_images/HOTELS/White Knight Hotel-1.jpg"),
                                    fit: BoxFit.fill,
                                    opacity: 0.5),
                                borderRadius: BorderRadius.circular(10),
                                color: brownColor),
                            child: Center(
                              child: Text(
                                "White Knight Hotel",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "AdobeDevanagari",
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 20,
                    )
                  ]),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingButtonNavBarComponent(),
          bottomNavigationBar: BottomNavigationBarComponent(),
        ));
  }
}
