import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/screens/login/language_primary_color_settings.dart';


class ChangePrimaryColor extends StatefulWidget {
  const ChangePrimaryColor({Key? key}) : super(key: key);

  @override
  ChangePrimaryColorState createState() => ChangePrimaryColorState();
}


class ChangePrimaryColorState extends State<ChangePrimaryColor> {


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        Get.off(()=>const LanguageColorSettings());
        return true;
      },
      child: Directionality(
          textDirection:
          appDir.value == "rtl" ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              title: const Text(
                  "Change Language"
              ),
              elevation: 0,
            ),
            body: Column(
              children:  [
                Theme(
                  data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Colors.grey,
                      disabledColor: Colors.grey
                  ),
                  child: RadioListTile<Color>(
                    title: const Text("Purple",style: TextStyle(color: Colors.black)),
                    value: Color(0xFFA761C4),
                    activeColor: primaryColor,
                    groupValue: primaryColor,
                    onChanged: (value){
                      setState(() {
                        primaryColor = value as Color;
                        secondaryColor = Color(0xFF613659);
                        thirdColor = Color(0x536D407D);
                        bgColor = Color(0xffF2F2F2);
                      });
                    },
                  ),
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Colors.grey,
                      disabledColor: Colors.grey
                  ),
                  child: RadioListTile<Color>(
                    title: const Text("Green",style: TextStyle(color: Colors.black),),
                    value: Color(0xFF317D0C),
                    activeColor: primaryColor,
                    groupValue: primaryColor,
                    onChanged: (value){
                      setState(() {
                        primaryColor = value as Color;
                        secondaryColor = Color(0xFF45AA13);
                        thirdColor = Color(0xFFA8D2A8);
                        bgColor = Color(0xFFEAF1E9);
                      });
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
