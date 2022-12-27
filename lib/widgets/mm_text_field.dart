// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text_field.dart';
import 'package:moment/helpers/widgets/cm_text.dart';


Widget MMTextField (
{
 String text = "",
String? actionText,
Color actionColor=Colors.white,
required double width,
bool autofocus = false,
required TextEditingController controller,
Function(String)? onChanged,
TextInputType keyboardType =TextInputType.text,
Color? actionBackgroundColor,
Function()? onSuffixIconTap,
Color inputColor = cmTextFieldInputColor,
Function()? onTap,
bool readOnly = false,
  double textContainerWidth = 80,
  double scrollPadding = 20,
}
    ) {
  return CmTextField(
    scrollPadding: scrollPadding,
    focusBorderColor: primaryColor,
      readOnly: readOnly,
      onTap: onTap,
      inputColor: inputColor,
      keyboardType: keyboardType,
      autofocus: autofocus,
      controller: controller,
      marginTop: 0,
      marginBottom: 0,
      hintText: text,
      onSuffixIconTap: onSuffixIconTap,
      onChanged: onChanged,
      borderColor:const Color(0xFFF2F2F2),
      width: width,
      labelTextColor:const Color(0xFFC4C4C6) ,
      suffixWidget:actionText!=null
          ? CmContainer(
        paddingBottom: 10,
        paddingTop: 10,
        marginEnd: 16,
        width: textContainerWidth,
        height: 19,
        child: CmContainer(
            color: actionBackgroundColor??primaryColor,
            borderRadiusAll: 16,
            child: Center(
              child: CmText(
                text: actionText,
                color: actionColor,
                fontSize: 14,
              ),
            )),
      )
          :null
  );
}
