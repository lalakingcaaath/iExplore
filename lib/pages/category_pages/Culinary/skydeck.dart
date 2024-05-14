import 'package:flutter/material.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SkyDeck extends StatefulWidget {
  const SkyDeck({Key? key}) : super(key: key);

  @override
  State<SkyDeck> createState() => _SkyDeckState();
}

class _SkyDeckState extends State<SkyDeck> {
  final firestoreInstance = FirebaseFirestore.instance;
  String _data = "";

  @override
  void dispose() {
    _data = ""; // Reset _data when the widget is disposed
    super.dispose();
  }

  void fetchData() {
    firestoreInstance.collection('tour_categories').doc('Culinary').get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
        setState(() {
          _data = data["Skydeck"] ?? "";
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
        appBar: HeaderAppBarComponent(headerTitle: 'Culinary Tours'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Sky Deck View Bar", style: TextStyle(
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
                            image: AssetImage("images/category_images/CULINARIES/Skydeck-bayleaf.jpg"),
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
