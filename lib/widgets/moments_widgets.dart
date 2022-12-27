import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_button.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/screens/create_moment/create_moment.dart';
import 'package:moment/utils/functions.dart';

Widget MMAvailableMoment ({
  required String time,
  required double width,
}) {
  return CmContainer(
    marginBottom: 16,
    child: InkWell(
      onTap: (){
        Get.to(()=> const CreateMoment());
      },
      child: CmContainer(
        width: width,
        color:  Colors.white.withOpacity(0.7),
        paddingBottom: 15,
        paddingTop: 15,
        paddingEnd: 16,
        paddingStart: 16,
        borderRadiusAll: 16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CmText(text: time,fontSize: 14,),
            SizedBox(height: 4,),
            Row(
              children:  [
                CmContainer(
                  width: 20.0,
                  height: 20.0,
                  child: Image.asset("assets/images/addButton.png"),),
                 CmText(text: df("available"),fontSize: 24,),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget MMMdContainer ({
  required String text,
  required double width,
}
    ) {
  return CmContainer(
    width: width,
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

Widget MMPeopleMomentJoin ({
  required String username,
  required String momentName,
  required String type,
  required String time,
  required String location,
  required String people,
  required bool canJoin,
  required double width,
}) {
  return CmContainer(
    width: width,
    color:  Colors.white,
    marginBottom: 16,
    paddingBottom: 15,
    paddingTop: 15,
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
        const SizedBox(height: 13,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CmContainer(
              width: 12.0,
              height: 12.0,
              child: Image.asset("assets/images/pin.png"),),
            const SizedBox(width: 8,),
            CmText(text: location,fontSize: 16,decoration: TextDecoration.underline,)
          ],
        ),
        const SizedBox(height: 13,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CmContainer(
              width: 12.0,
              height: 12.0,
              child: Image.asset("assets/images/wallClock.png"),),
            const SizedBox(width: 8,),
            CmText(text: time,fontSize: 16,)
          ],
        ),
        const SizedBox(height: 4,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CmContainer(
              width: 12.0,
              height: 12.0,
              child: Image.asset("assets/images/people.png"),),
            const SizedBox(width: 8,),
            CmText(text: people,fontSize: 16,decoration:TextDecoration.underline)
          ],
        ),
        const SizedBox(height: 16,),
        canJoin ? CmButton(
          backgroundColor: primaryColor,
          child: CmText(text: "Join",fontSize: 18,color: Colors.white,),
          height: 32,
          padding: 0,
        ):SizedBox(),
      ],
    ),
  );
}

Widget MMProfileMoment ({
  required String username,
  required String momentName,
  required String type,
  required String time,
  required String location,
  required String people,
  required double width,
}) {
  return Stack(
    children: [
      CmContainer(
          width: width,
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
          width: width,
          color:  Colors.white,
          paddingBottom: 15,
          paddingTop: 15,
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

Widget MMTakenMoment ({
  required String username,
  required String momentName,
  required String type,
  required String time,
  required String location,
  required String people,
  required double width
}){
  return CmContainer(
    width: width,
    color:  Colors.white,
    marginBottom: 16,
    paddingBottom: 15,
    paddingTop: 15,
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
  );
}
Widget weekWidget (
    {
      required VoidCallback onTap,
      required Color color,
      required Color textColor,
      required String dayName,
      required String date,
      required double width
    }
    ) {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: InkWell(
      onTap: onTap,
      child: CmContainer(
        color: color,
        width: width,
        height: 88,
        borderRadiusAll: 16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  [
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: CmText(text: dayName,fontSize: 17,color: textColor),
            ),
            CmText(text: date,fontSize: 32,color: textColor)
            // child,
            // child,
          ],
        ),
      ),
    ),
  );
}

Widget bottomButton({
  required BuildContext context,
  required VoidCallback onPress,
  required String text,
}) {
  return CmContainer(
    height: 80,
    color: Colors.white,
    borderRadiusTopStart: 16,
    borderRadiusTopEnd: 16,
    borderColor: Color(0xFFDFD8D0),
    borderWidthAll: 1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CmButton(
          backgroundColor: primaryColor,
          onPressed: onPress,
          padding: 0,
          marginBottom: 0,
          marginTop: 0,
          height: 48,
          width: widthAccordingRation(context, 338),
          child: CmText(
            text: text,
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ],
    ),
  );
}

Widget inboxWidget ({
  required int index,
  required String name,
  required String message,
  required String location,
  required String date,
  required String time,
}) {
  return CmContainer(
      marginTop: index==0? 0:8,
      marginBottom: 8,
      color: Colors.white,
      paddingTop: 25,
      paddingStart: 19,
      paddingEnd: 19,
      borderRadiusAll: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/profile.png",
                width: 48,
                height: 48,
              ),
              const SizedBox(width: 8,),
              Flexible(
                child: RichText(
                    text: TextSpan(
                        text: name+" ",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 17),
                        children: [

                          TextSpan(
                            text:  message,
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 17),
                          )
                        ]
                    )),
              ),

            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CmContainer(
                width: 14.0,
                height: 14.0,
                child: Image.asset("assets/images/pin.png"),),
              const SizedBox(
                width: 4,
              ),
              CmText(
                text: location,
                fontSize: 16,
                decoration: TextDecoration.underline,
              )
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction:Axis.horizontal,
            spacing: 2,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CmContainer(
                    width: 14.0,
                    height: 14.0,
                    child: Image.asset("assets/images/pin.png"),),
                  SizedBox(width: 4,),
                  CmText(
                    text: date,
                    fontSize: 16,
                  ),
                ],
              ),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [CmContainer(
                  width: 14.0,
                  height: 14.0,
                  child: Image.asset("assets/images/wallClock.png"),),
                  SizedBox(width: 4,),
                  CmText(
                    text: time,
                    fontSize: 16,
                  ),],
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children:  [
              Flexible(
                flex: 1,
                child: CmButton(
                    height: 32,
                    padding: 0,
                    backgroundColor: primaryColor,
                    borderColor: primaryColor,
                    borderWidth: 1,
                    borderRadius: 100,
                    child: CmText(text: "Join", color: Colors.white)),
              ),
              SizedBox(
                width: 8,
              ),
              Flexible(
                flex: 1,
                child: CmButton(
                    height: 32,
                    padding: 0,
                    backgroundColor: Colors.white,
                    borderColor: secondaryColor,
                    borderWidth: 1,
                    borderRadius: 100,
                    child: CmText(
                      text: "Decline",
                      color: secondaryColor,
                    )),
              )
            ],
          ),
          const SizedBox(
            height: 38,
          ),
        ],
      ));
}

Widget searchUserWidget ({
  required String identity,
  required String image,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: CmContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CmContainer(
              paddingEnd: 15,
              paddingStart: 15,
              child: Row(
                children: [
                  CmContainer(

                    width: 32,
                    height: 32,
                    child: Image.asset(
                        image),),
                  const SizedBox(
                    width: 8,
                  ),
                  CmText(text: identity)
                ],
              ),
            ),
            // const SizedBox(
            //   height: 0,
            // ),
            const Divider(color: Color(0xFF625A63),)
          ],
        )),
  );
}

