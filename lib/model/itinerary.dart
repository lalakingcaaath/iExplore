class Itinerary {
  final String category;
  final String duration;
  final String timeOfDay;
  final int budget;
  final List<DayActivity> activities;

  Itinerary({
    required this.category,
    required this.duration,
    required this.timeOfDay,
    required this.budget,
    required this.activities,
  });

  factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
        category: json['category'] as String,
        duration: json['duration'] as String,
        timeOfDay: json['time_of_day'] as String,
        budget: json['budget'] as int,
        activities: (json['activities'] as List)
            .map((activity) => DayActivity.fromJson(activity))
            .toList(),
      );
}

class DayActivity {
  final int day;
  final List<Activity> activity;

  DayActivity({
    required this.day,
    required this.activity,
  });

  factory DayActivity.fromJson(Map<String, dynamic> json) => DayActivity(
        day: json['day'] as int,
        activity: (json['activity'] as List)
            .map((act) => Activity.fromJson(act))
            .toList(),
      );
}

class Activity {
  final String time;
  final String location;
  final String whatToDo;

  Activity({
    required this.time,
    required this.location,
    required this.whatToDo,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        time: json['time'] as String,
        location: json['location'] as String,
        whatToDo: json['what_to_do'] as String,
      );
}
