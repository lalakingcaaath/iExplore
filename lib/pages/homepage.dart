import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_explore/services/auth_service.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String _userID;

  void _getUserID() {
    AuthService _authService = Provider.of<AuthService>(context, listen: false);
    _userID = _authService.user!.uid;
    print('UserUID: $_userID');
  }

  @override
  void initState() {
    super.initState();
    AuthService _authService = Provider.of<AuthService>(context, listen: false);
    _userID = _authService.user!.uid; // Store userUid in the class-level variable
    print('UserUID: $_userID');
  }

  Future<List<DocumentSnapshot>> _getFavorites() async {
    await _getUserID;

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(_userID)
        .collection('favorites')
        .get();
    return snapshot.docs;
  }

  Future<void> _removeFavorite(String favoriteID) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_userID)
        .collection('favorites')
        .doc(favoriteID)
        .delete();
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
          appBar: HeaderAppBarComponent(headerTitle: 'Home dashboard'),
          body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                          decoration: BoxDecoration(
                              color: lightOrangeColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Text(
                                "WELCOME TO THE PHILIPPINES",
                                style: TextStyle(
                                    color: orangeTwoColor,
                                    fontFamily: 'AdobeDevanagari',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.search,
                                  color: orangeTwoColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                    ),
                    Container(
                      color: lightOrangeColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "TOUR CATEGORIES",
                            style: TextStyle(
                              color: orangeTwoColor,
                              fontSize: 20,
                              fontFamily: 'AdobeDevanagari',
                            ),
                          ),
                          GestureDetector(
                            onTap: () => context.push('/home/itinerary_Collection'),
                            child: Text(
                              "See more",
                              style: TextStyle(
                                color: orangeTwoColor,
                                fontSize: 20,
                                fontFamily: 'AdobeDevanagari',
                                decoration: TextDecoration.underline
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                    ),
                    Container(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _itineraryCard(context, "CULINARY", "images/category_images/CULINARY.jpg", "/home/culinaries"),
                          _itineraryCard(context, "ECOTOURISM", "images/category_images/IMG_6121.jpg", "/home/ecotourism"),
                          _itineraryCard(context, "SCHOOLS", "images/category_images/SCHOOL.jpg", "/home/schools"),
                          _itineraryCard(context, "HOTELS", "images/category_images/HOTEL-1.jpg", "/home/hotels"),
                          _itineraryCard(context, "ADVENTURE", "images/category_images/ADVENTURE-2.jpg", "/home/adventures"),
                          _itineraryCard(context, "LEISURE", "images/category_images/LEISURE-4.jpg", "/home/leisures"),
                          _itineraryCard(context, "PILGRIMAGE", "images/category_images/PILGRIMAGE-1.jpg", "/home/pilgrimage"),
                          _itineraryCard(context, "CULTURAL", "images/category_images/CULTURAL.jpg", "/home/cultural")
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                    ),
                    Container(
                      color: lightOrangeColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "YOUR FAVORITES",
                            style: TextStyle(
                                color: orangeTwoColor,
                                fontFamily: 'AdobeDevanagari',
                                fontSize: 20
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                    ),
                    Container(
                      height: 100,
                      child: FutureBuilder(
                        future: _getFavorites(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text("Error: ${snapshot.error}"),
                            );
                          } else {
                            List<DocumentSnapshot> favorites = snapshot.data ?? [];
                            if (favorites.isEmpty) {
                              return Center(
                                child: Text(
                                  "No favorites yet.", style: TextStyle(
                                    fontFamily: 'FSP-Demo',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.white
                                ),
                                ),
                              );
                            } else {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: favorites.length,
                                itemBuilder: (context, index) {
                                  Map<String, dynamic> favoriteDate = favorites[index].data() as Map<String, dynamic>;
                                  String imagePath = favoriteDate["imagePath"];
                                  return Container(
                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                    width: 120,
                                    child: Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                    image: AssetImage(imagePath),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(10),
                                                  bottomRight: Radius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.favorite),
                                              color: Colors.red,
                                              onPressed: () async {
                                                await _removeFavorite(favorites[index].id);
                                                setState(() {
                                                  favorites.removeAt(index);
                                                });
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                          }
                        },
                      )
                    ),
                    Container(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.message_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Having a problem with your planning?", style: TextStyle(
                          color: Colors.white,
                          fontFamily: "AdobeDevanagari",
                          fontSize: 15
                        ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Tap the ", style: TextStyle(
                            color: Colors.white,
                            fontFamily: "AdobeDevanagari",
                            fontSize: 15
                        ),
                        ),
                        Image.asset("images/AI.png", width: 24, height: 24,),
                        Text(
                          " button", style: TextStyle(
                            color: Colors.white,
                            fontFamily: "AdobeDevanagari",
                            fontSize: 15
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
                        Container(
                          width: 260,
                          height: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "and let iExplorer PH suggest the best, most organized itineraries that match your style", style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "AdobeDevanagari"
                                ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingButtonNavBarComponent(),
          bottomNavigationBar: BottomNavigationBarComponent()
      ),
    );
  }
}


//Scrollable Itinerary Cards
Widget _itineraryCard(BuildContext context, String title, String imagePath, String pageRoute) {
  return GestureDetector(
    onTap: () => context.push(pageRoute),
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 120,
      decoration: BoxDecoration(
        color: brownColor,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fill,
            opacity: 0.5
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
         Center(
           child: Text(
             title, style: TextStyle(
             color: Colors.white,
             fontFamily: "AdobeDevanagari",
             fontWeight: FontWeight.bold,
             fontSize: 15
           ),
           ),
         )
        ],
      ),
    ),
  );
}