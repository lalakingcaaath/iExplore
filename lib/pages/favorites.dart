import 'package:flutter/material.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:i_explore/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
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
        appBar: HeaderAppBarComponent(headerTitle: "Favorites"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Itineraries", style: TextStyle(
                  color: Colors.white,
                  fontFamily: "FSP-Demo",
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
                ),
              ),
              FutureBuilder(
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
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: favorites.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> favoriteDate = favorites[index].data() as Map<String, dynamic>;
                              String itinerary = favoriteDate["itinerary"];
                              String imagePath = favoriteDate["imagePath"];
                              return Dismissible(
                                key: Key(favorites[index].id),
                                direction: DismissDirection.endToStart,
                                onDismissed: (direction) async {
                                  await _removeFavorite(favorites[index].id);
                                  setState(() {
                                    favorites.removeAt(index);
                                  });
                                },
                                background: Container(
                                  color: Colors.red,
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.delete, color: Colors.white, size: 50),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Text(
                                              itinerary, textAlign: TextAlign.center, style: TextStyle(
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
                                                  image: AssetImage(imagePath),
                                                  fit: BoxFit.fill
                                              )
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 20)
                                  ],
                                ),
                              );
                            }
                        );
                      }
                    }
                  }
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Schedule", style: TextStyle(
                    color: Colors.white,
                    fontFamily: "FSP-Demo",
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
                ),
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
