// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment/helpers/widgets/cm_directionality.dart';
import 'package:moment/utils/constants.dart';

class MMScaffold extends StatelessWidget {
  final Widget? appBar;
  final Widget body;
  Color? backgroundColor;

  MMScaffold({Key? key, this.appBar, required this.body, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    backgroundColor ??= Colors.grey[200];
    return
      OrientationBuilder(
        builder: (context, orientation) {
          //check orientation variable to identiy the current mode
          if(orientation == Orientation.portrait){
            print("The screen is in Portrait mode");
          }

          if(orientation == Orientation.landscape){
            print("The screen is on Landscape mode.");
          }

          return CmDirectionality(
              child:Scaffold(
                backgroundColor: backgroundColor,
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(100),
                  child: appBar ?? const PreferredSize( preferredSize: Size.fromHeight(0),child:SizedBox(height: 0,)),
                ),
                body: Container(
                    width: Get.width,
                    height: Get.height,
                    padding:  EdgeInsets.all(widthAccordingRation(context,16)), child: body),
              )
          );
        });


  }
}
