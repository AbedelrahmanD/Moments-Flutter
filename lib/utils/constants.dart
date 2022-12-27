

import 'dart:math';

import 'package:moment/utils/functions.dart';

double designScreenWidth = 375.0;
double designScreenHeight = 812.0;



List categories = [
  "All",
  "Personal",
  "Business",
  "Restaurant",
  "Cafe",
  "Social",
  "Sport",
  "Entertainment",
  "Appointment",
  "Travel"
];

dynamic isAvailableArray = [
  [false,true,false,true,true,true,false,true,false,true,true,false,true,true,true,true],
  [true,true,false,true,false,true,false,true,false,false,false,true,false,true,false,true],
  [false,false,false,true,true,true,false,true,false,true,false,true,true,true,false,true],
  [true,false,true,true,true,true,false,true,false,true,false,false,true,true,true,true],
  [false,true,true,true,true,true,false,true,false,true,true,false,true,true,true,true],
  [true,true,true,true,true,true,false,true,true,true,true,false,false,true,true,true],
  [false,false,false,false,true,true,false,true,true,true,true,false,false,true,true,true],
  [true,false,false,true,false,true,false,true,true,true,true,false,true,false,true,true],
  [false,true,false,true,true,true,false,true,false,true,true,false,true,true,true,true],
  [true,true,true,true,true,true,false,true,true,false,true,false,true,true,true,false],

];

List networkNames = [
  "Ahmad Mohamed",
  "Mahmoud Sobhy",
  "Mostafa Hussein",
  "Osama Hassan",
  "Hanan Ezz",
  "Salma Mostafa",
  "Salma Mostafa",
  "Salma Mostafa",
  "Jihan Shaker",
  "Esslam Mohsen"
];

List momentsName = [
  "Watch a movie",
  "Read a book",
  "Watch a match",
  "Business Meeting",
];

final random = new Random();
var now = new DateTime.now();

dynamic moments =
{
  for(int i=0;i<categories.length;i++)
    "${categories[i]}" : [
      {
        "time":"00:00 - 01:30",
        "isAvailable": isAvailableArray[i][0],
        "moment": {"username":"Dr. Zaidan Alenezi",
          "momentName":momentsName[random.nextInt(momentsName.length)],
          "type":"${categories[i]}",
          "location":"VOX Cinema - Red Sea Mall",
          "people":"12 " +df("people")
        }
      },
      {
        "time":"01:30 - 02:00",
        "isAvailable": isAvailableArray[i][1],
        "moment": {"username":"Dr. Zaidan Alenezi",
          "momentName":momentsName[random.nextInt(momentsName.length)],
          "type":"${categories[i]}",
          "location":"VOX Cinema - Red Sea Mall",
          "people":"12 " +df("people")
        }
      },
      {
        "time":"02:00 - 04:30",
        "isAvailable": isAvailableArray[i][2],
        "moment": {"username":"Dr. Zaidan Alenezi","momentName":momentsName[random.nextInt(momentsName.length)],"type":"${categories[i]}","location":"Al Rabeea Café - Jeddah",
          "people":"12 " +df("people")
        }
      },
      {
        "time":"05:00 - 06:00",
        "isAvailable": isAvailableArray[i][3],
        "moment": {"username":"Dr. Zaidan Alenezi",
          "momentName":momentsName[random.nextInt(momentsName.length)],
          "type":"${categories[i]}",
          "location":"VOX Cinema - Red Sea Mall",
          "people":"12 " +df("people")
        }
      },
      {
        "time":"06:00 - 07:00",
        "isAvailable": isAvailableArray[i][4],
        "moment": {"username":"Dr. Zaidan Alenezi",
          "momentName":momentsName[random.nextInt(momentsName.length)],
          "type":"${categories[i]}",
          "location":"VOX Cinema - Red Sea Mall",
          "people":"12 " +df("people")
        }
      },
      {
        "time":"07:00 - 08:00",
        "isAvailable": isAvailableArray[i][5],
        "moment": {"username":"Dr. Zaidan Alenezi",
          "momentName":momentsName[random.nextInt(momentsName.length)],
          "type":"${categories[i]}",
          "location":"VOX Cinema - Red Sea Mall",
          "people":"12 " +df("people")
        }
      },
      {
        "time":"08:00 - 11:00",
        "isAvailable": isAvailableArray[i][6],
        "moment": {"username":"Dr. Zaidan Alenezi","momentName":momentsName[random.nextInt(momentsName.length)],"type":"${categories[i]}","location":"Business Park",
          "people":"12 " +df("people")
        }
      },
    ],
};





