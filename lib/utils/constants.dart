

import 'package:flutter/material.dart';


double designScreenWidth = 375.0;
double designScreenHeight = 812.0;

// dynamic moments =
// {
//   "all" : [
//     {
//       "time":"00:00 - 01:30",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi",
//         "momentName":"Watch the match",
//         "type":"Entertainment",
//         "location":"VOX Cinema - Red Sea Mall",
//         "people":"12 People"}
//     },
//     {
//       "time":"01:30 - 02:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"02:00 - 04:30",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Watch the match","type":"Entertainment","location":"Al Rabeea Café - Jeddah","people":"12 People"}
//     },
//     {
//       "time":"05:00 - 06:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"06:00 - 07:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"07:00 - 08:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"08:00 - 11:00",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Business Meeting","type":"Business","location":"Business Park","people":"12 People"}
//     },
//   ],
//   "Personal" : [
//     {
//       "time":"00:00 - 01:30",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi",
//         "momentName":"Watch the match",
//         "type":"Entertainment",
//         "location":"VOX Cinema - Red Sea Mall",
//         "people":"12 People"}
//     },
//     {
//       "time":"01:30 - 02:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"02:00 - 04:30",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Watch the match","type":"Entertainment","location":"Al Rabeea Café - Jeddah","people":"12 People"}
//     },
//     {
//       "time":"05:00 - 06:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"06:00 - 07:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"07:00 - 08:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"08:00 - 11:00",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Business Meeting","type":"Business","location":"Business Park","people":"12 People"}
//     },
//   ],
//   "Business" : [
//     {
//       "time":"00:00 - 01:30",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi",
//         "momentName":"Watch the match",
//         "type":"Entertainment",
//         "location":"VOX Cinema - Red Sea Mall",
//         "people":"12 People"}
//     },
//     {
//       "time":"01:30 - 02:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"02:00 - 04:30",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Watch the match","type":"Entertainment","location":"Al Rabeea Café - Jeddah","people":"12 People"}
//     },
//     {
//       "time":"05:00 - 06:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"06:00 - 07:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"07:00 - 08:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"08:00 - 11:00",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Business Meeting","type":"Business","location":"Business Park","people":"12 People"}
//     },
//   ],
//   "Restaurant" : [
//     {
//       "time":"00:00 - 01:30",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi",
//         "momentName":"Watch the match",
//         "type":"Entertainment",
//         "location":"VOX Cinema - Red Sea Mall",
//         "people":"12 People"}
//     },
//     {
//       "time":"01:30 - 02:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"02:00 - 04:30",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Watch the match","type":"Entertainment","location":"Al Rabeea Café - Jeddah","people":"12 People"}
//     },
//     {
//       "time":"05:00 - 06:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"06:00 - 07:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"07:00 - 08:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"08:00 - 11:00",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Business Meeting","type":"Business","location":"Business Park","people":"12 People"}
//     },
//   ],
//   "Cafe" : [
//     {
//       "time":"00:00 - 01:30",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi",
//         "momentName":"Watch the match",
//         "type":"Entertainment",
//         "location":"VOX Cinema - Red Sea Mall",
//         "people":"12 People"}
//     },
//     {
//       "time":"01:30 - 02:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"02:00 - 04:30",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Watch the match","type":"Entertainment","location":"Al Rabeea Café - Jeddah","people":"12 People"}
//     },
//     {
//       "time":"05:00 - 06:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"06:00 - 07:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"07:00 - 08:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"08:00 - 11:00",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Business Meeting","type":"Business","location":"Business Park","people":"12 People"}
//     },
//   ],
//   "all" : [
//     {
//       "time":"00:00 - 01:30",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi",
//         "momentName":"Watch the match",
//         "type":"Entertainment",
//         "location":"VOX Cinema - Red Sea Mall",
//         "people":"12 People"}
//     },
//     {
//       "time":"01:30 - 02:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"02:00 - 04:30",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Watch the match","type":"Entertainment","location":"Al Rabeea Café - Jeddah","people":"12 People"}
//     },
//     {
//       "time":"05:00 - 06:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"06:00 - 07:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"07:00 - 08:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"08:00 - 11:00",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Business Meeting","type":"Business","location":"Business Park","people":"12 People"}
//     },
//   ],
//   "all" : [
//     {
//       "time":"00:00 - 01:30",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi",
//         "momentName":"Watch the match",
//         "type":"Entertainment",
//         "location":"VOX Cinema - Red Sea Mall",
//         "people":"12 People"}
//     },
//     {
//       "time":"01:30 - 02:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"02:00 - 04:30",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Watch the match","type":"Entertainment","location":"Al Rabeea Café - Jeddah","people":"12 People"}
//     },
//     {
//       "time":"05:00 - 06:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"06:00 - 07:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"07:00 - 08:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"08:00 - 11:00",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Business Meeting","type":"Business","location":"Business Park","people":"12 People"}
//     },
//   ],
//   "all" : [
//     {
//       "time":"00:00 - 01:30",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi",
//         "momentName":"Watch the match",
//         "type":"Entertainment",
//         "location":"VOX Cinema - Red Sea Mall",
//         "people":"12 People"}
//     },
//     {
//       "time":"01:30 - 02:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"02:00 - 04:30",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Watch the match","type":"Entertainment","location":"Al Rabeea Café - Jeddah","people":"12 People"}
//     },
//     {
//       "time":"05:00 - 06:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"06:00 - 07:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"07:00 - 08:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"08:00 - 11:00",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Business Meeting","type":"Business","location":"Business Park","people":"12 People"}
//     },
//   ],
//   "all" : [
//     {
//       "time":"00:00 - 01:30",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi",
//         "momentName":"Watch the match",
//         "type":"Entertainment",
//         "location":"VOX Cinema - Red Sea Mall",
//         "people":"12 People"}
//     },
//     {
//       "time":"01:30 - 02:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"02:00 - 04:30",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Watch the match","type":"Entertainment","location":"Al Rabeea Café - Jeddah","people":"12 People"}
//     },
//     {
//       "time":"05:00 - 06:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"06:00 - 07:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"07:00 - 08:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"08:00 - 11:00",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Business Meeting","type":"Business","location":"Business Park","people":"12 People"}
//     },
//   ],
//   "all" : [
//     {
//       "time":"00:00 - 01:30",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi",
//         "momentName":"Watch the match",
//         "type":"Entertainment",
//         "location":"VOX Cinema - Red Sea Mall",
//         "people":"12 People"}
//     },
//     {
//       "time":"01:30 - 02:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"02:00 - 04:30",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Watch the match","type":"Entertainment","location":"Al Rabeea Café - Jeddah","people":"12 People"}
//     },
//     {
//       "time":"05:00 - 06:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"06:00 - 07:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"07:00 - 08:00",
//       "isAvailable": true,
//       "moment": null
//     },
//     {
//       "time":"08:00 - 11:00",
//       "isAvailable": false,
//       "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Business Meeting","type":"Business","location":"Business Park","people":"12 People"}
//     },
//   ],
// };

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



dynamic moments =
{
  for(int i=0;i<categories.length;i++)
    "${categories[i]}" : [
      {
        "time":"00:00 - 01:30",
        "isAvailable": isAvailableArray[i][0],
        "moment": {"username":"Dr. Zaidan Alenezi",
          "momentName":"Watch the match",
          "type":"${categories[i]}",
          "location":"VOX Cinema - Red Sea Mall",
          "people":"12 People"}
      },
      {
        "time":"01:30 - 02:00",
        "isAvailable": isAvailableArray[i][1],
        "moment": {"username":"Dr. Zaidan Alenezi",
          "momentName":"Watch the match",
          "type":"${categories[i]}",
          "location":"VOX Cinema - Red Sea Mall",
          "people":"12 People"}
      },
      {
        "time":"02:00 - 04:30",
        "isAvailable": isAvailableArray[i][2],
        "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Watch the match","type":"${categories[i]}","location":"Al Rabeea Café - Jeddah","people":"12 People"}
      },
      {
        "time":"05:00 - 06:00",
        "isAvailable": isAvailableArray[i][3],
        "moment": {"username":"Dr. Zaidan Alenezi",
          "momentName":"Watch the match",
          "type":"${categories[i]}",
          "location":"VOX Cinema - Red Sea Mall",
          "people":"12 People"}
      },
      {
        "time":"06:00 - 07:00",
        "isAvailable": isAvailableArray[i][4],
        "moment": {"username":"Dr. Zaidan Alenezi",
          "momentName":"Watch the match",
          "type":"${categories[i]}",
          "location":"VOX Cinema - Red Sea Mall",
          "people":"12 People"}
      },
      {
        "time":"07:00 - 08:00",
        "isAvailable": isAvailableArray[i][5],
        "moment": {"username":"Dr. Zaidan Alenezi",
          "momentName":"Watch the match",
          "type":"${categories[i]}",
          "location":"VOX Cinema - Red Sea Mall",
          "people":"12 People"}
      },
      {
        "time":"08:00 - 11:00",
        "isAvailable": isAvailableArray[i][6],
        "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Business Meeting","type":"${categories[i]}","location":"Business Park","people":"12 People"}
      },
    ],
};

fillMoments () {
  // moments.add(
  //
  // )
}



double widthAccordingRation (context,double w){
  double widthScreenRation = width(context)/designScreenWidth;
  return w * widthScreenRation;
}

double heightAccordingRation (context,double h){
  double heightScreenRation = height(context)/designScreenHeight;
  return h * heightScreenRation;
}

double width (context, {double? value}) {
  value ??= 1;
  return MediaQuery.of(context).size.width * value;
}

double height (context, {double? value}) {
  value ??= 1;
  return MediaQuery.of(context).size.height * value;
}


