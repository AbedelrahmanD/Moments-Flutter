
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/localization/language/ar.dart' as ar_lang;
import 'package:moment/localization/language/en.dart' as en_lang;

import 'constants.dart';

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

generateOneWeekForward (DateFormat dayNameFormatter, DateFormat dateFormatter, DateFormat fullDateFormatter) {
  List days = [];
  for (int i = 0; i < 7; i++) {
    final nextDay = DateTime(now.year, now.month, now.day + i);
    days.add(
      {
        "dayName": i == 0 ? "Today" : dayNameFormatter.format(nextDay),
        "date": dateFormatter.format(nextDay),
        "fullDate": fullDateFormatter.format(nextDay)
      },
    );
  }
  return days;
}

fillTimeInputs() {
  var monthFormatter = new DateFormat('MMMM');
  var yearFormatter = new DateFormat('yyyy');
  String month = monthFormatter.format(now);
  String year = yearFormatter.format(now);

  var fullDateFormatter = new DateFormat('EEEE MMMM dd, y');
  var dayNameFormatter = new DateFormat('EEEE');
  var dateFormatter = new DateFormat('dd');
  List days = generateOneWeekForward(dayNameFormatter,dateFormatter,fullDateFormatter);
  // for (int i = 0; i < 7; i++) {
  //   final nextDay = DateTime(now.year, now.month, now.day + i);
  //   print(i);
  //   days.add(
  //     {
  //       "dayName": i == 0 ? "Today" : dayNameFormatter.format(nextDay),
  //       "date": dateFormatter.format(nextDay),
  //       "fullDate": fullDateFormatter.format(nextDay)
  //     },
  //   );
  // }
  String selectedDay = days[0]["fullDate"];
  return {
    "month": month,
    "year" :year,
    "days" :days,
    "selectedDay" :selectedDay,
  };
}

String df(String key) {
  if (appDir.value == "ltr") {
    return en_lang.language[key] ?? "";
  }
  return ar_lang.language[key] ?? "";
}