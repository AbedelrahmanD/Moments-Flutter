// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text_field.dart';
import 'package:moment/helpers/widgets/cm_text.dart';

class MMTextField extends StatelessWidget {
  final String text;
  final String? actionText;
  final Color actionColor;
   Color? actionBackgroundColor;
  final Function()? onSuffixIconTap;

   MMTextField({Key? key, this.text = "",this.onSuffixIconTap,this.actionText,this.actionColor=Colors.white,this.actionBackgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CmTextField(
      hintText: "Verification Code",
      onSuffixIconTap: onSuffixIconTap,
      suffixWidget:actionText!=null
          ? CmContainer(
        paddingAll: 10,
        width: 100,
        child: CmContainer(
            color: actionBackgroundColor??primaryColor,
            height: 5,
            borderRadiusAll: 20,
            width: 100,
            child: Center(
              child: CmText(
                text: actionText??"",
                color: actionColor,
                fontSize: 14,
              ),
            )),
      )
          :null
    );
  }
}
