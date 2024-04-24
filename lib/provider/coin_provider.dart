import 'package:flutter/material.dart';
import 'package:i_explore/model/coin_model.dart';
import 'package:i_explore/services/firestore_service.dart';

class CoinProvider extends ChangeNotifier {
  Coin? _coin;

  Coin? get coinValue => _coin;

  void fetchCoinData(String user_id) async {
    try {
      final Map<String, dynamic> data =
          await FirestoreService().readCoinData(user_id);
      _coin = Coin.fromFirestore(data);
      print(_coin!.coinValue);
      notifyListeners();
    } catch (err) {
      throw Exception(err);
    }
  }
}
