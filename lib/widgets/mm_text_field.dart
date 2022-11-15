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
  final double width;
   Color? actionBackgroundColor;
  final Function()? onSuffixIconTap;

   MMTextField({Key? key, this.text = "",this.onSuffixIconTap,this.actionText,this.actionColor=Colors.white,this.actionBackgroundColor, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CmTextField(
      marginTop: 0,
      marginBottom: 0,
      hintText: text,
      onSuffixIconTap: onSuffixIconTap,

        borderColor:const Color(0xFFF2F2F2),
      width: width,
      labelTextColor:const Color(0xFFC4C4C6) ,
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
