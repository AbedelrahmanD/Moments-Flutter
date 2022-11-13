import 'package:flutter/material.dart';
import 'package:moment/screens/login.dart';
import 'package:get/get.dart';
void main() {
  runApp(GetMaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.green,

    ),
    home:const Login(),
  ));
}
