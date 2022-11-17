import 'package:flutter/material.dart';
import 'package:moment/helpers/widgets/cm_button.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/utils/constants.dart';

class MMAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? custom;
  final bool centerTitle;
  final Widget? appBarExtends;

  const MMAppBar(
      {Key? key, this.title = "", this.custom, this.actions, this.leading,this.centerTitle=true,this.appBarExtends})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
      padding:  const EdgeInsets.fromLTRB(17, 8, 17,16),
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
          appBarExtends??const SizedBox(height: 0,width: 0,)
        ],
      ),
    );
  }
}
