 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment/helpers/widgets/cm_button.dart';

showAlert(String title) {
    return Get.defaultDialog(
        titlePadding: const EdgeInsets.all(0),
        title: "",
        titleStyle: const TextStyle(fontSize: 0),
        radius: 20,
        content:  Column(
          children:  [
            const Icon(Icons.error, color: Colors.yellow, size: 91,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(title,textAlign: TextAlign.center,),
            ),
          ],
        ),
        actions: [
           Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: CmButton(
              child: const Text("Okay"),
              onPressed: (){
                Get.back();
              },
            ),
          ),
        ]);
}