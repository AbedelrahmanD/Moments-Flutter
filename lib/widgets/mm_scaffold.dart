// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_directionality.dart';

Widget MMScaffold({
  Widget? appBar,
  required Widget body,
  EdgeInsetsGeometry? bodyPadding,
  Color? backgroundColor,
  double appBarSize = 97,
  Widget bottomNavigationBar = const SizedBox(),
}) {
  backgroundColor ??= bgColor;
  bodyPadding ??= EdgeInsets.only(left: 16, right: 16, top: 16);
  return OrientationBuilder(builder: (context, orientation) {
    //check orientation variable to identify the current mode
    if (orientation == Orientation.portrait) {
      // print("The screen is in Portrait mode");
    }

    if (orientation == Orientation.landscape) {
      // print("The screen is on Landscape mode.");
    }

    return CmDirectionality(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(appBarSize),
          child: appBar ??
              const PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: SizedBox(
                    height: 0,
                  )),
        ),
        body: Container(
            width: Get.width,
            height: Get.height,
            padding: bodyPadding,
            child: body),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  });
}
