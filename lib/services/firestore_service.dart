import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final db = FirebaseFirestore.instance;

  final user = <String, dynamic>{
    "first": "Ada",
    "last": "Lovelace",
    "born": 1815
  };

  final city = <String, String>{
    "name": "Los Angeles",
    "state": "CA",
    "country": "USA"
  };

  void addSampleData() {
    // db
    // .collection("users")
    // .add(user)
    // .then((DocumentReference doc) =>
    //     print('DocumentSnapshot added with ID: ${doc.id}'));

    // To create or overwrite a single document use .set()
    db
        .collection('cities')
        .doc('LA')
        .set(city)
        .onError((error, _) => print('Error writing document: $error'));
  }

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

  void addSampleCoins(String user_id, int coinValue) {
    final sampleData = <String, int>{
      "iCoins": coinValue,
    };

    db.collection('users').doc(user_id).set(sampleData).onError(
        (error, stackTrace) => print('Error writing document: $error'));

    print('Added coins');
  }

  Future<Map<String, dynamic>> readCoinData(String user_id) async {
    try {
      final docRef = await db.collection('users').doc(user_id).get();

      if (!docRef.exists) {
        return {'iCoins': 0};
      }

      final data = docRef.data() as Map<String, dynamic>;

      return data;
    } catch (err) {
      throw Exception(err);
    }
  }
}
