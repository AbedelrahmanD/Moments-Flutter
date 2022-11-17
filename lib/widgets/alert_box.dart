 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment/helpers/widgets/cm_button.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/helpers/widgets/cm_text_field.dart';
import 'package:moment/utils/constants.dart';

showAlert({required String title}) {
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

 showAlertNoAction({required Widget widget}) {
   return Get.defaultDialog(
     backgroundColor: const Color(0xFFF2F2F2),
       titlePadding: const EdgeInsets.all(4),
       title: "",
       titleStyle: const TextStyle(fontSize: 0),
       radius: 20,
       content: widget,
       );
 }

 showAlertFillData({
        required VoidCallback onPressed,
        required TextEditingController controller,
        required double width,
        required double buttonWidth,
        required String placeholder,
 }) {
   return Get.defaultDialog(
     backgroundColor: const Color(0xFFF2F2F2),
     titlePadding: const EdgeInsets.all(4),
     title: "",
     titleStyle: const TextStyle(fontSize: 0),
     radius: 20,
     content: Column(
       crossAxisAlignment: CrossAxisAlignment.end,
       children: [
         CmTextField(
           controller: controller,
           width: width,
           height: 48,
           borderColor: Colors.white,
           inputColor: Colors.white,
           hintText: placeholder,
         ),
         const SizedBox(
           height: 16,
         ),
          CmButton(
            onPressed: onPressed,
           marginTop: 0,
           marginBottom: 0,
           padding: 0,
           height: 32,
             width: buttonWidth,
             child: const CmText(
           text: "Save",
               color: Colors.white,
               fontSize: 18,
         ))
       ],
     ),
   );
 }