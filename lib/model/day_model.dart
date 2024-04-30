import 'package:cloud_firestore/cloud_firestore.dart';

class DayModel {
  final String id;
  final int goodForDays;
  final String title;
  final String desc;

  const DayModel(
      {required this.id,
      required this.goodForDays,
      required this.title,
      required this.desc});

  factory DayModel.fromFirestore(String id, DocumentSnapshot data) {
    return DayModel(
        id: id,
        goodForDays: data['goodForDays'],
        title: data['title'],
        desc: data['desc']);
  }
}
