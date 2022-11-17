import 'package:flutter/material.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';

Widget ship ({
  required double width,
  double height = 24,
  required String text,
  required VoidCallback onTap,
  Color? backgroundColor,
  Color? color,
  double marginBottom =24,
  double marginTop= 16,
}
    ) {
  return InkWell(
    onTap: onTap,
    child: CmContainer(
      marginBottom: marginBottom,
      marginTop: marginTop,
      child: CmContainer(
          width:width,
          height: height,
          color:backgroundColor??primaryColor,
          borderRadiusAll: 16,
          marginEnd: 8,
          child: Center(
            child: CmText(
              text: text,
              fontSize: 14,
              color:color?? Colors.white,
              align: TextAlign.center,
            ),
          )),
    ),
  );
}