import 'package:flutter/material.dart';
import 'package:get/get.dart';
var appDir = "ltr".obs;
 Color primaryColor = Color(0xFFA761C4);
Color secondaryColor = Color(0xFF613659);
Color thirdColor =Color(0x536D407D);
Color bgColor = Color(0xffF2F2F2);
final Map<int, Color> primaryColorMap = {
  50: primaryColor,
  100: primaryColor,
  200: primaryColor,
  300: primaryColor,
  400: primaryColor,
  500:primaryColor,
  600: primaryColor,
  700: primaryColor,
  800: primaryColor,
  900: primaryColor,
};
final MaterialColor primaryColorSwatch = MaterialColor(50, primaryColorMap);

///***CmTextField
const Color cmTextFieldHintTextColor = Colors.grey;
 Color cmTextFieldLabelTextColor = primaryColor;
const Color cmTextFieldInputColor = Colors.transparent;
const Color cmTextFieldBorderColor = Colors.grey;
 Color cmTextFieldFocusBorderColor = primaryColor;
const Color cmTextFieldIconColor = Color(0xFFA761C4);
const double cmTextFieldBorderRadius = 16;
const double cmTextFieldWidth = 300;
const double cmTextFieldHeight = 48;
const double cmTextFieldMarginTop = 0;
const double cmTextFieldMarginBottom = 0;
const double cmTextFieldScrollPadding = 120;


///***CmButton
const Color cmButtonColor = Colors.white;
 Color cmButtonBackgroundColor = primaryColor;
const Color cmButtonBorderColor = Colors.transparent;
const Color cmButtonBoxShadowColor = Colors.transparent;
const double cmButtonPadding = 15.0;
const double cmButtonBorderRadius = 16;
const double cmButtonBorderWidth = 2;
const double cmButtonWidth = 300;
const double cmButtonHeight = 56;
const double cmButtonMarginTop = 10;
const double cmButtonMarginBottom = 10;
const double cmButtonElevation=0;

///***CmCachedNetworkImage
const Widget cmCachedNetworkImagePlaceholder=CircularProgressIndicator();

///***fontFamily
const String textFontFamily="";
const List<String> textFontFamilyFallback=["Droid.Arabic.Kufi"];


const double widthSmallScreen=600;
const double widthMidScreen=1000;