import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/screens/create_moment.dart';
import 'package:moment/utils/constants.dart';

class MMAvailableMoment extends StatelessWidget {
  final String time;
  const MMAvailableMoment({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CmContainer(
      marginBottom: 16,
      child: InkWell(
        onTap: (){
          // Get.to(()=> const CreateMoment());
        },
        child: CmContainer(
          width: width(context),
          height: 88,
          color:  Colors.white.withOpacity(0.7),
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
      ),
    );
  }
}
