import 'package:flutter/material.dart';
import 'package:moment/helpers/widgets/cm_container.dart';

Widget MMLogo({double? width}) {
  return CmContainer(
      width: width, child: Image.asset("assets/images/logo.png"));
}
