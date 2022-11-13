import 'package:flutter/material.dart';
import 'package:moment/widgets/mm_button.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/widgets/mm_text_field.dart';
import 'package:get/get.dart';
import 'package:moment/screens/home.dart';
import 'package:moment/widgets/mm_logo.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MMScaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.2,
                ),
                const MMLogo(),
                const SizedBox(
                  height: 20,
                ),
                MMTextField(
                  text: "Mobile Number",
                  actionText: "Verify",
                  onSuffixIconTap: () {},
                ),
                MMTextField(
                  text: "Verification Code",
                  actionText: "Resend",
                  actionColor: Colors.grey,
                  actionBackgroundColor: Colors.white,
                  onSuffixIconTap: () {},
                ),
                const CmText(
                  text:
                      "By clicking start you agree to our Term of services and Privacy policy",
                  color: Colors.grey,
                  fontSize: 14,
                  align: TextAlign.center,
                ),
                SizedBox(
                  height: Get.height * 0.15,
                ),
                MMButton(
                  onPressed: () {
                    Get.off(() => const Home());
                  },
                  text: "Start",
                )
              ],
            ),
          ),
        ));
  }
}
