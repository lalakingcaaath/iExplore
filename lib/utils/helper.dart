String toCapitalizeFirstLetter(String word) {
  return word[0].toUpperCase() + word.substring(1);
}

String itineraryPrompt(int days, int hours, List<String> category, int budget,
    {String optional = ''}) {
  return """
give me a itineraries in the philippines given on based preference: ${days} day, ${hours} hours, ${category}, ${budget} pesos budget, optional: ${optional}. 
response in json format
{
  itinerary: {
    category: '',
    duration: '', 
    number_of_days: '', 
    budget: , 
    remarks: ,
    activities: [
  {
      day: 1,
      activity: [
        {
          time: '', 
          location: '', 
          'what_to_do': "" 
        },
        {
          time: '',
        location: '', 
   'what_to_do': "",
   }
}
]
},
]
}
}

 CONSTRAINTS: 
// format of json.
// limit 3-5 activity
// if 6 or more day duartion. activites should be limited to day: 2 - 4
 // what_to_do is string of what people should do in that place. 
 // location should be specific, and also searchable in google map e.g. name of establishment, food stalls, museum
 // time is formatted in "10:00am - 11:00am"
 // duration is integer
 // number_of_days is integer
 // budget is double  
 // give remarks if necessary to the road trip""";
}
