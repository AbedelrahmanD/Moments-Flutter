import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/utils/constants.dart';
import 'package:moment/widgets/alert_box.dart';
import 'package:moment/widgets/mm_button.dart';
import 'package:moment/widgets/mm_logo.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:moment/widgets/mm_text_field.dart';

import 'home.dart';

class LoginName extends StatefulWidget {
  const LoginName({Key? key}) : super(key: key);

  @override
  _LoginNameState createState() => _LoginNameState();
}

class _LoginNameState extends State<LoginName> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MMScaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const MMLogo(),
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
                  text: "Real Name",
                  onChanged: (value){
                    setState(() {

                    });
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Using your real name enhances your experience In',),
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
                      showAlert("Please Fill Your Name!");
                    }
                    else {
                      Get.to(() => const Home());
                    }
                  },
                  text: "Next",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    InkWell(
                      onTap: (){
                        Get.off(() => const Home());
                      },
                        child: const CmText(text: "SKIP",align: TextAlign.end,fontSize: 14,color:primaryColor,decoration: TextDecoration.underline,)),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
