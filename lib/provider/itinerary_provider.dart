import 'package:flutter/material.dart';
import 'package:i_explore/model/itinerary_model.dart';

class ItineraryProvider extends ChangeNotifier {
  Itinerary? _itinerary;

  List<Itinerary> favitineraries = [];

  Itinerary? get itineraryVal => _itinerary;

  void fetchItinerary(Map<String, dynamic> json) {
    _itinerary = Itinerary.fromJson(json);
    notifyListeners();
  }

  void fetchFavoriteItinerary(List<Itinerary> itineraries) {
    favitineraries = itineraries;
    notifyListeners();
  }

}
