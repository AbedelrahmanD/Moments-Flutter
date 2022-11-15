import 'package:flutter/material.dart';
import 'package:get/get.dart';

double designScreenWidth = 375.0;
double designScreenHeight = 812.0;



double widthAccordingRation (double width){
  double widthScreenRation = width/designScreenWidth;
  return width * widthScreenRation;
}

double heightAccordingRation (double height){
  double heightScreenRation = height/designScreenHeight;
  return height * heightScreenRation;
}

double width (context, {double? value}) {
  value ??= 1;
  return MediaQuery.of(context).size.width * value;
}

double height (context, {double? value}) {
  value ??= 1;
  return MediaQuery.of(context).size.height * value;
}


