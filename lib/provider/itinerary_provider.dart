import 'package:flutter/material.dart';
import 'package:i_explore/model/itinerary_model.dart';

class ItineraryProvider extends ChangeNotifier { 
  Itinerary? _itinerary;

  Itinerary? get itineraryVal => _itinerary; 

  void fetchItinerary(Map<String, dynamic> json) { 
    _itinerary = Itinerary.fromJson(json);
    notifyListeners();
  }

}