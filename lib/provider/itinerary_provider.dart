import 'package:flutter/material.dart';
import 'package:i_explore/model/itinerary_model.dart';

class ItineraryProvider extends ChangeNotifier {
  Itinerary? _itinerary;

  List<Itinerary> _itineraries = [];

  Itinerary? get itineraryVal => _itinerary;

  void fetchItinerary(Map<String, dynamic> json) {
    _itinerary = Itinerary.fromJson(json);
    notifyListeners();
  }

  // TODO add a list of itineraries in saved page
}
