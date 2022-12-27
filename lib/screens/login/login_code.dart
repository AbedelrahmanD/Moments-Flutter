import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/screens/login/login_name.dart';
import 'package:moment/utils/functions.dart';
import 'package:moment/widgets/alert_box.dart';
import 'package:moment/widgets/mm_button.dart';
import 'package:moment/widgets/mm_logo.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:moment/widgets/mm_text_field.dart';


class LoginCode extends StatefulWidget {
  const LoginCode({Key? key}) : super(key: key);

  @override
  LoginCodeState createState() => LoginCodeState();
}

class LoginCodeState extends State<LoginCode> {
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MMScaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme:  IconThemeData(
            color: primaryColor,
          ),
        ),
        appBarSize: 50,
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MMLogo(),
                SizedBox(
                  height: heightAccordingRation(context,48),
                ),
                MMTextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value){
                    setState(() {

                    });
                  },
                  autofocus: true,
                  controller: codeController,
                  width: widthAccordingRation(context,341),
                  text: "Verification Code",

                ),
                SizedBox(
                  height: heightAccordingRation(context,80),
                ),
                MMButton(
                  color: codeController.text.isEmpty?const Color(0xFFF2F2F2):primaryColor,
                  textColor: codeController.text.isEmpty?const Color(0x3C3C434D):Colors.white,
                  width: width(context),
                  onPressed: () {
                    if(codeController.text.isEmpty){
                      showAlert(title: "Please fill the verification code!");
                    }
                    else {
                      Get.to(() => const LoginName());
                    }
                  },
                  text: "Next",
                )
              ],
            ),
          ),
        ));
  }
}
