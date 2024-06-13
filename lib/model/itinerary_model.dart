import 'package:cloud_firestore/cloud_firestore.dart';

class Itinerary {
  String? id;
  final String title;
  final String category;
  final int duration;
  final int numberOfDays;
  final double budget;
  final String remarks;

  final List<Activity> activities;

  Itinerary(
      {this.id,
      required this.title,
      required this.category,
      required this.duration,
      required this.numberOfDays,
      required this.budget,
      required this.remarks,
      required this.activities});

  factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
      title: json['title'] as String,
      category: json['category'] as String,
      duration: json['duration'] as int,
      numberOfDays: json['number_of_days'] as int,
      budget: json['budget'] as double,
      remarks: json['remarks'] as String,
      activities: (json['activities'] as List)
          .map((activity) => Activity.fromJson(activity))
          .toList());

  factory Itinerary.fromFirestore(
          {required String id, required DocumentSnapshot data}) =>
      Itinerary(
          id: id,
          title: data['\"title\"'],
          category: data['\"category\"'],
          duration: data['\"duration\"'],
          numberOfDays: data['\"number_of_days\"'],
          budget: data['\"budget\"'],
          remarks: data['\"remarks\"'],
          activities: (data['\"activities\"'] as List)
              .map((activity) => Activity.fromFirestore(activity))
              .toList());

  // * make model class to be formatted in json

  // ? is there a easy way to do this?
  Map<String, dynamic> toJson() => {
        "\"title\"": title,
        "\"category\"": category,
        "\"duration\"": duration,
        "\"number_of_days\"": numberOfDays,
        "\"budget\"": budget,
        "\"remarks\"": "\"${remarks}\"",
        "\"activities\"":
            activities.map((activity) => activity.toJson()).toList()
      };
}

class Activity {
  final int day;
  final List<ActivityDetail> activity;

  Activity({
    required this.day,
    required this.activity,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
      day: json['day'] as int,
      activity: (json['activity'] as List)
          .map((detail) => ActivityDetail.fromJson(detail))
          .toList());

  factory Activity.fromFirestore(Map<String, dynamic> data) => Activity(
      day: data['\"day\"'],
      activity: (data['\"activity\"'] as List)
          .map((detail) => ActivityDetail.fromFirestore(detail))
          .toList());

  Map<String, dynamic> toJson() => {
        "\"day\"": day,
        "\"activity\"": activity.map((actDetail) => actDetail.toJson()).toList()
      };
}

class ActivityDetail {
  final String time;
  final String location;
  final String whatToDo;

  ActivityDetail({
    required this.time,
    required this.location,
    required this.whatToDo,
  });

  factory ActivityDetail.fromJson(Map<String, dynamic> json) => ActivityDetail(
        time: json['time'] as String,
        location: json['location'] as String,
        whatToDo: json["what_to_do"] as String,
      );

  Map<String, dynamic> toJson() => {
        "\"time\"": "\"${time}\"",
        "\"location\"": "\"${location}\"",
        "\"what_to_do\"": "\"${whatToDo}\""
      };

  factory ActivityDetail.fromFirestore(Map<String, dynamic> data) =>
      ActivityDetail(
          time: data['\"time\"'],
          location: data['\"location\"'],
          whatToDo: data['\"what_to_do\"']);
}
