import 'package:flutter/material.dart';
import 'package:moment/helpers/widgets/cm_container.dart';

Widget MMAppBar({
  String title = "",
  List<Widget>? actions,
  Widget? leading,
  Widget? custom,
  bool centerTitle = true,
  Widget? appBarExtends,
}) {
  return CmContainer(
    isClipHardEdge: true,
    paddingTop: 8,
    paddingStart: 17,
    paddingEnd: 17,
    paddingBottom: 16,
    color: Colors.white,
    borderRadiusBottomStart: 16,
    borderRadiusBottomEnd: 16,
    borderWidthAll: 1,
    borderColor: const Color(0xffDFD8D0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBar(
          leadingWidth: 40,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: custom ??
              Text(
                title,
                style: const TextStyle(color: Colors.black),
              ),
          centerTitle: centerTitle,
          actions: actions,
          leading: leading,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        appBarExtends ??
            const SizedBox(
              height: 0,
              width: 0,
            )
      ],
    ),
  );
}
