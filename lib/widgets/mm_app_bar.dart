import 'package:flutter/material.dart';

class MMAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? custom;

  const MMAppBar(
      {Key? key, this.title = "", this.custom, this.actions, this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: custom ??
            Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
        actions: actions,
        leading: leading,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
