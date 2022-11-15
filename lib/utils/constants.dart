

import 'package:flutter/material.dart';


double designScreenWidth = 375.0;
double designScreenHeight = 812.0;



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


