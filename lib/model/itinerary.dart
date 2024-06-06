class Itinerary {
  final String duration;
  final String timeOfDay;
  final String theme;
  final String budget;
  final List<Activity> activities;

  Itinerary({
    required this.duration,
    required this.timeOfDay,
    required this.theme,
    required this.budget,
    required this.activities,
  });

  factory Itinerary.fromJson(Map<String, dynamic> json) {
    final itinerary = json['itinerary'] as Map<String, dynamic>;
    return Itinerary(
      duration: itinerary['duration'] as String,
      timeOfDay: itinerary['time_of_day'] as String,
      theme: itinerary['theme'] as String,
      budget: itinerary['budget'] as String,
      activities: (itinerary['activities'] as List)
          .map((activity) => Activity.fromJson(activity))
          .toList(),
    );
  }
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

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      time: json['time'] as String,
      location: json['location'] as String,
      whatToDo: json['what_to_do'] as String,
    );
  }
}
