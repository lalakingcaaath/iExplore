import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_explore/model/coin_model.dart';
import 'package:i_explore/services/auth_service.dart';

class FirestoreService {
  final db = FirebaseFirestore.instance;

  final String userId = AuthService().user!.uid;

  void addUserSampleData(
    String user_id,
    String displayName,
    int age,
  ) {
    print(displayName);
    final sampleData = <String, dynamic>{
      "name": displayName,
      "age": age,
    };

    db.collection('users').doc(user_id).set(sampleData).onError(
        (error, stackTrace) => print('Error writing document: $error'));
  }

  void addSampleCoins(int coinValue) {
    final sampleData = <String, dynamic>{
      "iCoins": FieldValue.increment(coinValue),
      "updatedAt": FieldValue.serverTimestamp(),
    };

    db.collection('users').doc(userId).update(sampleData).onError(
        (error, stackTrace) => print('Error writing document: $error'));

    print('Added coins');
  }

  void removeSampleCoins(int coinValue) {
    final sampleData = <String, dynamic>{
      "iCoins": FieldValue.increment(-coinValue),
      "updatedAt": FieldValue.serverTimestamp(),
    };

    db.collection('users').doc(userId).update(sampleData).onError(
        (error, stackTrace) => print('Error writing document: $error'));

    print('Removed coins');
  }

  Future<Coin> readCoinData() async {
    try {
      final docRef = await db.collection('users').doc(userId).get();

      if (!docRef.exists) {
        return Coin(coinValue: 0);
      }

      final data = docRef.data() as Map<String, dynamic>;

      return Coin.fromFirestore(data);
    } catch (err) {
      throw Exception(err);
    }
  }
}
