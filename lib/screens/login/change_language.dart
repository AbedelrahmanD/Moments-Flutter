import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/screens/login/language_primary_color_settings.dart';



class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  ChangeLanguageState createState() => ChangeLanguageState();
}


class ChangeLanguageState extends State<ChangeLanguage> {


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
                  child: RadioListTile(
                    title: const Text("العربية",style: TextStyle(color: Colors.black)),
                    value: "rtl",
                    activeColor: primaryColor,
                    groupValue: appDir.value,
                    onChanged: (value){
                      setState(() {
                        appDir.value = "rtl";
                      });
                      print(appDir.value);
                    },
                  ),
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Colors.grey,
                      disabledColor: Colors.grey
                  ),
                  child: RadioListTile(
                    title: const Text("English",style: TextStyle(color: Colors.black),),
                    value: "ltr",
                    activeColor: primaryColor,
                    groupValue: appDir.value,
                    onChanged: (value){
                      setState(() {
                        appDir.value = "ltr";
                      });
                      print(appDir.value);
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
