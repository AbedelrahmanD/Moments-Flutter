import 'package:flutter/material.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/utils/constants.dart';

class MMProfileMoment extends StatelessWidget {
  final String username;
  final String momentName;
  final String type;
  final String time;
  final String location;
  final String people;
  const MMProfileMoment({Key? key, required this.username, required this.momentName, required this.time, required this.location, required this.people, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CmContainer(
          width: widthAccordingRation(context, 338),
            marginBottom: 16,
            height: 210,
            color: Colors.grey.withOpacity(0.1),
            borderRadiusAll: 16,
            child: Container()
        ),
        Positioned(
          bottom: 25,
          left: 16,

          child: Row(
          children: [
            Row(
              children:  [
                CmContainer(
                  width: 20.0,
                  height: 20.0,
                  child: Image.asset("assets/images/addButton.png"),),
                const CmText(text: " Available",fontSize: 24,),
              ],
            )
          ],
        ),
        ),
        Positioned(
          top: 0,
          child: CmContainer(
            width: widthAccordingRation(context, 338),
            color:  Colors.white,
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
                        width: 32,
                        height: 32,
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
                    CmContainer(
                      width: 12.0,
                      height: 12.0,
                      child: Image.asset("assets/images/wallClock.png"),),
                    const SizedBox(width: 8,),
                    CmText(text: time,fontSize: 16,)
                  ],
                ),
                const SizedBox(height: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CmContainer(
                      width: 12.0,
                      height: 12.0,
                      child: Image.asset("assets/images/pin.png"),),
                    const SizedBox(width: 8,),
                    CmText(text: location,fontSize: 12,decoration: TextDecoration.underline,)
                  ],
                ),
                const SizedBox(height: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CmContainer(
                      width: 12.0,
                      height: 12.0,
                      child: Image.asset("assets/images/people.png"),),
                    const SizedBox(width: 8,),
                    CmText(text: people,fontSize: 12,decoration:TextDecoration.underline)
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
