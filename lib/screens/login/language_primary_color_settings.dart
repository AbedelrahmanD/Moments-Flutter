import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/screens/login/change_language.dart';
import 'package:moment/screens/login/change_primary_color.dart';



class LanguageColorSettings extends StatefulWidget {
  const LanguageColorSettings({Key? key}) : super(key: key);

  @override
  LanguageColorSettingsState createState() => LanguageColorSettingsState();
}


class LanguageColorSettingsState extends State<LanguageColorSettings> {


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        // Get.off(()=>const NewCategories());
        return true;
      },
      child: Directionality(
          textDirection:
          appDir.value == "rtl" ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              title: const Text(
                  "Settings"
              ),
              elevation: 0,
            ),
            body: Column(
              children: [
                ListTile(onTap: (){
                  Get.off(()=> ChangeLanguage());
                },
                title: Text("Change Language"),
                ),
                ListTile(onTap: (){
                  Get.off(()=> ChangePrimaryColor());
                },
                  title: Text("Change Main Color"),
                ),
              ],
            )
          )),
    );
  }
}
