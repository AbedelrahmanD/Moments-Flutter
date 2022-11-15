import 'package:flutter/material.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
class MMLogo extends StatelessWidget {
  final double? width;
  const MMLogo({Key? key,this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CmContainer(
      width: width,
        child: Image.asset("assets/images/logo.png"));
  }
}
