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

  // ! all functions below might be deleted

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
        print(data);
      }
      return data;
    } catch (err) {
      print(err);
      return [];
    }
  }

  // * itinerary function
  // TODO add firestore functions

  Future<void> saveItinenary(Map<String, dynamic> json) async {
    try {
      // TODO improvements in code are needed
      await users.doc(userId).collection('generated_itinerary').doc().set(json);

      print('saved');
    } catch (e) {
      print(e);
    }
  }

  // TODO add array of itineraries
  Future<void> getAllItinenary() async {
    try {
      final collection = users.doc(userId).collection('generated_itinerary');

      final querySnapshot = await collection.get();

      for (var docSnapshot in querySnapshot.docs) {
        print('${docSnapshot.id} => ${docSnapshot.data()}');
      }
    } catch (e) {
      print(e);
    }
  }

  // TODO integrate with table
  Future<void> getItineraryById(String id) async {
    try {
      final collection =
          users.doc(userId).collection('generated_itinerary').doc(id);
      final querySnapshot = await collection.get();

      print(querySnapshot.data());
    } catch (e) {
      print(e);
    }
  }

  // * coin functions

  void addUserCoins() {
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
        addUserCoins();
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
