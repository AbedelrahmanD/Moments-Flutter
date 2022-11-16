import 'package:flutter/material.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/screens/login_mobile.dart';
import 'package:get/get.dart';
void main() {
  runApp(GetMaterialApp(
    theme: ThemeData(
      primarySwatch: primaryColorSwatch,

    ),
    home:const LoginMobile(),
  ));
}
