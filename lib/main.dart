import 'package:flutter/material.dart';
import 'package:moment/helpers/config.dart';
import 'package:get/get.dart';
import 'package:moment/screens/login/login_mobile.dart';
void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: primaryColorSwatch,

    ),
    home:const LoginMobile(),
  ));
}
