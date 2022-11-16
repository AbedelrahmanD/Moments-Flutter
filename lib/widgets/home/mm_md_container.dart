import 'package:flutter/material.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/utils/constants.dart';

class MMMdContainer extends StatelessWidget {
  final String text;
  const MMMdContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CmContainer(
      width: widthAccordingRation(context, 165),
      height: 32,
      color: Colors.white,
      borderRadiusAll: 16,
      child: Center(
        child: CmText(
          text: text,
        ),
      ),
    );
  }
}
