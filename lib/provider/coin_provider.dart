import 'package:flutter/material.dart';
import 'package:i_explore/model/coin_model.dart';
import 'package:i_explore/services/firestore_service.dart';

class CoinProvider extends ChangeNotifier {
  Coin? _coin;

  Coin? get coinValue => _coin;

  void fetchCoinData() async {
    try {
      _coin = await FirestoreService().readCoinData();
      print(_coin!.coinValue);
      notifyListeners();
    } catch (err) {
      throw Exception(err);
    }
  }
}
