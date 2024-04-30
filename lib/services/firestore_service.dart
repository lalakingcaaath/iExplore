import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_explore/model/coin_model.dart';
import 'package:i_explore/model/day_model.dart';
import 'package:i_explore/services/auth_service.dart';

class FirestoreService {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  final String userId = AuthService().user!.uid;

  // Collections
  final users = db.collection('users');
  final itineraries = db.collection('itineraries');

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

  Future<void> getIternaries(String region, String city) async {
    try {
      final placeCollection =
          await itineraries.doc(region).collection(city).get();

      for (var i in placeCollection.docs) {
        DayModel dayModel = DayModel.fromFirestore(i.id, i);
        print(dayModel.id +
            dayModel.desc); // Corrected to print dayModel properties
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<DayModel>> getRecommendedIternaries(
      String region, String city, int days) async {
    List<DayModel> data = [];
    try {
      final placeCollection = await itineraries
          .doc(region)
          .collection(city)
          .where('goodForDays', isEqualTo: days)
          .get();

      for (var i in placeCollection.docs) {
        data.add(DayModel.fromFirestore(i.id, i));
      }
      return data;
    } catch (err) {
      print(err);
      return [];
    }
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



  // Future<void> getIternaries() async {
  //   // sample collection manila_itineraries
  //   // then documents such as
  //   //  -> LsM9TWEgtBIJ0UjKxmRi
  //   //  ----> then. they should have a subcollections: comments & sched
  //   //  -------> comments (collection) - uniqueid (document) - {comment, name, rating, commentPosted} (fields)

  //   db.collection('manila_itineraries').get().then((querySnap) {
  //     for (var i in querySnap.docs) {
  //       print('${i.id} => ${i.data()}');
  //     }
  //   });
  // }
