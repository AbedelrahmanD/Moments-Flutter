import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment/helpers/widgets/cm_button.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
class MMButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final double width;
  const MMButton({Key? key,this.text="",this.onPressed,required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CmButton(
      onPressed: onPressed,
      width: width,
      child: CmText(text: text,color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),
    );
  }
}
