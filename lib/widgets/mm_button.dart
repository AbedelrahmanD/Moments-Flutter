import 'package:flutter/material.dart';

import 'package:moment/helpers/widgets/cm_button.dart';
import 'package:moment/helpers/widgets/cm_text.dart';

Widget MMButton({
  String text = "",
  Function()? onPressed,
  required double width,
  required Color color,
  Color textColor = Colors.white,
}) {
  return CmButton(
    backgroundColor: color,
    onPressed: onPressed,
    width: width,
    // borderColor: Colors.white,
    child: CmText(
      text: text,
      color: textColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}
