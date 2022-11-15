import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/utils/constants.dart';
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
                  height: heightAccordingRation(context,48),
                ),
                MMTextField(
                  controller: nameController,
                  width: widthAccordingRation(context,341),
                  text: "Mobile Number",
                ),
                SizedBox(
                  height: heightAccordingRation(context,80),
                ),
                MMButton(
                  color: primaryColor,
                  width: width(context),
                  onPressed: () {
                    Get.to(() => const LoginName());
                  },
                  text: "Next",
                )
              ],
            ),
          ),
        ));
  }
}
