import 'package:uuid/uuid.dart';

class Itinerary {
  String id = Uuid().v4();
  final String category;
  final int duration;
  final int numberOfDays;
  final double budget;
  final String remarks;

  final List<Activity> activities;

  Itinerary(
      {required this.category,
      required this.duration,
      required this.numberOfDays,
      required this.budget,
      required this.remarks,
      required this.activities});

  factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
      category: json['itinerary']['category'] as String,
      duration: json['itinerary']['duration'] as int,
      numberOfDays: json['itinerary']['number_of_days'] as int,
      budget: json['itinerary']['budget'] as double,
      remarks: json['itinerary']['remarks'] as String,
      activities: (json['itinerary']['activities'] as List)
          .map((activity) => Activity.fromJson(activity))
          .toList());
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
}
