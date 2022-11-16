import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/utils/constants.dart';

class MMAvailableMoment extends StatelessWidget {
  final String time;
  const MMAvailableMoment({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CmContainer(
      width: width(context),
      height: 88,
      color: const Color(0xFFDEDEDE),
      marginBottom: 16,
      paddingBottom: heightAccordingRation(context, 15),
      paddingTop: heightAccordingRation(context, 15),
      paddingEnd: 16,
      paddingStart: 16,
      borderRadiusAll: 16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CmText(text: time,fontSize: 14,),
          SizedBox(height: heightAccordingRation(context, 4),),
          Row(
            children:  [
              SvgPicture.asset(
                'assets/images/addButton.svg',
                height: 20.0,
                width: 20.0,
                allowDrawingOutsideViewBox: true,
              ),
              const CmText(text: " Available",fontSize: 24,),
            ],
          )
        ],
      ),
    );
  }
}
