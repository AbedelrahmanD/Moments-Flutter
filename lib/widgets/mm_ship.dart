import 'package:flutter/material.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
class MMShip extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? backgroundColor;
  const MMShip({Key? key,this.text="",this.color,this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CmContainer(
      child: CmContainer(
          minWidth: 50,
          height: 30,
          color:backgroundColor?? primaryColor,
          borderRadiusAll: 100,
          marginEnd: 5,
          child: Center(
            child: Row(
              children: [
               const SizedBox(width: 10,),
                CmText(
                  text: text,
                  color:color?? Colors.white,
                  align: TextAlign.center,
                ),
                const SizedBox(width: 10,),
              ],
            ),
          )),
    );
  }
}
