import 'package:flutter/material.dart';
import 'package:i_explore/components/BottomNavigationBarComponent.dart';
import 'package:i_explore/components/FloatingButtonNavBarComponent.dart';
import 'package:i_explore/components/HeaderAppBarComponent.dart';
import 'package:i_explore/model/itinerary_model.dart';
import 'package:i_explore/provider/itinerary_provider.dart';
import 'package:i_explore/services/firestore_service.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  bool _isLoading = false;

  void fetchFavorites() async {
    try {
      setState(() => _isLoading = true);

      final list = await FirestoreService().getFavoriteItinerary();
      Provider.of<ItineraryProvider>(context, listen: false)
          .fetchFavoriteItinerary(list);
    } catch (e) {
      print(e);
      setState(() => _isLoading = false);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchFavorites();
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
                  "Itineraries",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "FSP-Demo",
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              _isLoading ? CircularProgressIndicator() : SizedBox(height: 20),
              for (final itinerary
                  in Provider.of<ItineraryProvider>(context, listen: false)
                      .favitineraries)
                buildCards(itinerary),
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

Widget buildCards(Itinerary itinerary) {
  return Container(
    height: 80,
    width: 320,
    margin: const EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: lightOrangeColor),
    child: GestureDetector(
      onTap: () => print(itinerary.id),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${itinerary.title}",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: true,
              style: TextStyle(
                fontFamily: "AdobeDevanagari",
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: brownColor,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.sunny,
                      color: brownColor,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "${itinerary.numberOfDays} day",
                      style: TextStyle(
                          fontFamily: 'FSP-Demo',
                          fontWeight: FontWeight.w900,
                          color: brownColor),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.alarm,
                      color: brownColor,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "${itinerary.duration} hrs",
                      style: TextStyle(
                          fontFamily: 'FSP-Demo',
                          fontWeight: FontWeight.w900,
                          color: brownColor),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "₱",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: brownColor),
                    ),
                    Text(
                      "${itinerary.budget}",
                      style: TextStyle(
                          fontFamily: 'FSP-Demo',
                          fontWeight: FontWeight.w900,
                          color: brownColor),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
