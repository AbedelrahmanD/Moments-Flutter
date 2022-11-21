import 'package:flutter/material.dart';
import 'cm_container.dart';
import '../config.dart';

class CmButton extends StatelessWidget {
  final Widget child;
  final double padding;
  final Color backgroundColor;
  final Color color;
  final double borderWidth;
  final double borderRadius;
  final Color borderColor;
  final double width;
  final double height;
  final double marginTop;
  final double marginBottom;
  final Color boxShadowColor;
  final double spreadRadius;
  final double blurRadius;
  final Offset offset;
  final VoidCallback? onPressed;
  final double elevation;

  const CmButton({Key? key,
    required this.child,
    this.padding = cmButtonPadding,
    this.color = cmButtonColor,
    this.backgroundColor = cmButtonBackgroundColor,
    this.borderRadius = cmButtonBorderRadius,
    this.borderWidth = cmButtonBorderWidth,
    this.borderColor = cmButtonBorderColor,
    this.width = cmButtonWidth,
    this.height = cmButtonHeight,
    this.marginTop=cmButtonMarginTop,
    this.marginBottom=cmButtonMarginBottom,
    this.boxShadowColor = cmButtonBoxShadowColor,
    this.spreadRadius = 1,
    this.blurRadius = 5,
    this.offset = const Offset(0, 1),
    this.onPressed,
    this.elevation=cmButtonElevation
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CmContainer(
      boxShadowColor: boxShadowColor,
      spreadRadius: spreadRadius,
        blurRadius: blurRadius,
      offset: offset,
      marginTop: marginTop,
      marginBottom: marginBottom,
      borderRadiusAll: borderRadius,
      width: width,
      height: height,

      child: ElevatedButton(
        onPressed: onPressed,
        clipBehavior: Clip.hardEdge,
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(padding),
          backgroundColor: backgroundColor,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: borderWidth, color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius), // <-- Radius
          ),
        ),
        child: child,
      ),
    );
  }
}
