import 'package:flutter/material.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:i_explore/services/auth_service.dart';

class Baluarte extends StatefulWidget {
  const Baluarte({Key? key}) : super(key: key);

  @override
  State<Baluarte> createState() => _BaluarteState();
}

class _BaluarteState extends State<Baluarte> {
  final firestoreInstance = FirebaseFirestore.instance;
  String _data = "";
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

  void addFavorites(String itinerary, String imagePath) {
    _getUserID();

    FirebaseFirestore.instance
        .collection('users')
        .doc(_userID)
        .collection('favorites')
        .add({
      'itinerary': itinerary,
      'imagePath': imagePath,
    })
        .then((value) {
      print('Favorite added successfully!');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Added to Favorites!"))
      );
    })
        .catchError((error) {
      print('Error adding favorite: $error');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error adding to Favorites: $error"))
      );
    });
  }

  @override
  void dispose() {
    _data = ""; // Reset _data when the widget is disposed
    super.dispose();
  }

  void fetchData() {
    firestoreInstance.collection('tour_categories').doc('Leisure').get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
        setState(() {
          _data = data["Baluarte"] ?? "";
        });
      } else {
        print("Document does not exist");
      }
    });
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
        appBar: HeaderAppBarComponent(headerTitle: 'Leisure Tours'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Baluarte", style: TextStyle(
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
                  GestureDetector(
                    onDoubleTap: () {
                      addFavorites("Baluarte", "images/category_images/LEISURE/Baluarte.jpg");
                    },
                    child: Container(
                      width: 325,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("images/category_images/LEISURE/Baluarte.jpg"),
                              fit: BoxFit.fill
                          )
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: fetchData,
                    child: Container(
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
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "$_data", textAlign: TextAlign.center, style: TextStyle(
                    color: Colors.white,
                    fontFamily: "AdobeDevanagari",
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
                ),
              ),
              SizedBox(height: 30),
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
