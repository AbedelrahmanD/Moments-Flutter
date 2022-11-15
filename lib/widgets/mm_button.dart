import 'package:flutter/material.dart';

import 'package:moment/helpers/widgets/cm_button.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
class MMButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final double width;
  final Color color;
  final Color textColor;
  const MMButton({Key? key,this.text="",this.onPressed,this.textColor=Colors.white,required this.width,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CmButton(
      backgroundColor: color,
      onPressed: onPressed,
      width: width,
      child: CmText(text: text,color: textColor,fontSize: 20,fontWeight: FontWeight.bold,),
    );
  }
}
