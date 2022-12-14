import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/screens/home/home.dart';
import 'package:moment/screens/login/language_primary_color_settings.dart';
import 'package:moment/utils/functions.dart';
import 'package:moment/widgets/alert_box.dart';
import 'package:moment/widgets/mm_button.dart';
import 'package:moment/widgets/mm_logo.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:moment/widgets/mm_text_field.dart';


class LoginName extends StatefulWidget {
  const LoginName({Key? key}) : super(key: key);

  @override
  LoginNameState createState() => LoginNameState();
}

class LoginNameState extends State<LoginName> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MMScaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme:  IconThemeData(
            color: primaryColor,
          ),
          actions: [
            IconButton(onPressed: (){
              Get.to(()=> LanguageColorSettings());
            }, icon: Icon(Icons.settings))
          ],
        ),
        appBarSize: 50,
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 MMLogo(),
                SizedBox(
                  height: heightAccordingRation(context,40),
                ),
                CmContainer(
                    width: widthAccordingRation(context, 104),
                    height: heightAccordingRation(context, 104),
                    child: Image.asset("assets/images/profile.png")),

                SizedBox(
                  height: heightAccordingRation(context,40),
                ),
                MMTextField(
                  controller: nameController,
                  width: widthAccordingRation(context,341),
                  text: df("realName"),
                  autofocus: true,
                  onChanged: (value){
                    setState(() {

                    });
                  },
                  scrollPadding: 200,
                ),
                const SizedBox(
                  height: 8,
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text:  TextSpan(
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: df("realNameClarification"),),
                        TextSpan(text: ' MOMENTS', style: TextStyle(color: primaryColor)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: heightAccordingRation(context,80),
                ),
                MMButton(
                  color: nameController.text.isEmpty?const Color(0xFFF2F2F2):primaryColor,
                  textColor: nameController.text.isEmpty?const Color(0x3C3C434D):Colors.white,
                  width: width(context),
                  onPressed: () {
                    if(nameController.text.isEmpty){
                      showAlert(title: "Please Fill Your Name!");
                    }
                    else {
                      Get.to(() => const Home());
                    }
                  },
                  text: df(("next")),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // Container(),
                    InkWell(
                      onTap: (){
                        Get.to(() => const Home());
                      },
                        child:  CmText(text: df("skip"),align: TextAlign.end,fontSize: 14,color:primaryColor,decoration: TextDecoration.underline,)),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
