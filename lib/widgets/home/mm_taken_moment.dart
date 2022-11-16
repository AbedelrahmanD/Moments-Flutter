import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/utils/constants.dart';

class MMTakenMoment extends StatelessWidget {
  final String username;
  final String momentName;
  final String type;
  final String time;
  final String location;
  final String people;
  const MMTakenMoment({Key? key, required this.username, required this.momentName, required this.time, required this.location, required this.people, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CmContainer(
      width: width(context),
      color:  Colors.white,
      marginBottom: 16,
      paddingBottom: heightAccordingRation(context, 15),
      paddingTop: heightAccordingRation(context, 15),
      paddingEnd: 16,
      paddingStart: 16,
      borderRadiusAll: 16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CmContainer(
                  width: widthAccordingRation(context, 32),
                  height: heightAccordingRation(context, 32),
                  child: Image.asset("assets/images/profile.png")),
              const SizedBox(width: 4,),
              CmText(text: username,fontSize: 16,)
            ],
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CmText(text: momentName,fontSize: 24,),
              CmContainer(
                color: const Color(0xFFDEDEDE),
                borderRadiusAll: 16,
                width: 90,
                  height: 19,
                  child: Center(child: CmText(text: type,fontSize: 12,align: TextAlign.center,)),
              )
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/images/wallClock.svg',
                height: 12.0,
                width: 12.0,
                allowDrawingOutsideViewBox: true,
              ),
              const SizedBox(width: 4,),
              CmText(text: time,fontSize: 16,)
            ],
          ),
          const SizedBox(height: 3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/images/pin.svg',
                height: 12.0,
                width: 12.0,
                allowDrawingOutsideViewBox: true,
              ),
              const SizedBox(width: 8,),
              CmText(text: location,fontSize: 12,decoration: TextDecoration.underline,)
            ],
          ),
          const SizedBox(height: 3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/images/people.svg',
                height: 12.0,
                width: 12.0,
                allowDrawingOutsideViewBox: true,
              ),
              const SizedBox(width: 4,),
              CmText(text: people,fontSize: 12,decoration:TextDecoration.underline)
            ],
          ),
        ],
      ),
    );
  }
}
