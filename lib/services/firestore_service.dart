import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_explore/model/coin_model.dart';
import 'package:i_explore/services/auth_service.dart';

class FirestoreService {
  final db = FirebaseFirestore.instance;

  final String userId = AuthService().user!.uid;

  void addUser() {
    db.collection('users').doc(userId).set({'iCoins': 0}).onError(
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

  // void addItenaries() {
  //   final sampleData = <String, dynamic> {
  //     "time": "10:00AM",
  //     "place": "Place one",
  //     "whatToDo": ['eating', 'circus'],
  //   };

  //   db.collection()
  // }

  Future<void> getIternaries() async {
    // sample collection manila_itineraries
    // then documents such as
    //  -> LsM9TWEgtBIJ0UjKxmRi 
    //  ----> then. they should have a subcollections: comments & sched
    //  -------> comments (collection) - uniqueid (document) - {comment, name, rating, commentPosted} (fields)
    


    db.collection('manila_itineraries').get().then((querySnap) {
      for (var i in querySnap.docs) {
        print('${i.id} => ${i.data()}');
      }
    });
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
        // create a document if user doesnt exists in the database
        addUser();
        // then show the value of coin as 0
        return Coin(coinValue: 0);
      }

      final data = docRef.data() as Map<String, dynamic>;

      return Coin.fromFirestore(data);
    } catch (err) {
      throw Exception(err);
    }
  }
}
