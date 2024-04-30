import 'package:flutter/material.dart';
import 'package:i_explore/model/day_model.dart';

class DayProvider extends ChangeNotifier {
  List<DayModel> _day = [];

  List<DayModel> get dayValue => _day;

  void fetchDay(List<DayModel> list) {
    try {
      _day = list;
      print('added to the list');
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }
}
