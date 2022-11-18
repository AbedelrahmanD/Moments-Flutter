import 'package:flutter/material.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_button.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/helpers/widgets/cm_text_field.dart';
import 'package:moment/utils/constants.dart';
import 'package:moment/widgets/mm_app_bar.dart';
import 'package:moment/widgets/mm_scaffold.dart';

class InvitePeople extends StatefulWidget {
  const InvitePeople({Key? key}) : super(key: key);

  @override
  InvitePeopleState createState() => InvitePeopleState();
}

class InvitePeopleState extends State<InvitePeople> {

  List users = [
    {"image": "profile.png", "name": "Ahmad Mohamed"},
    {"image": "profile.png", "name": "Ahmad Mohamed"},
    {"image": "profile.png", "name": "Ahmad Mohamed"},
    {"image": "profile.png", "name": "Ahmad Mohamed"},
    {"image": "profile.png", "name": "Ahmad Mohamed"},
    {"image": "profile.png", "name": "Ahmad Mohamed"},
    {"image": "profile.png", "name": "Ahmad Mohamed"},
    {"image": "profile.png", "name": "Ahmad Mohamed"},
    {"image": "profile.png", "name": "Ahmad Mohamed"},
    {"image": "profile.png", "name": "Ahmad Mohamed"},
    {"image": "profile.png", "name": "Ahmad Mohamed"},
    {"image": "profile.png", "name": "Ahmad Mohamed"},
    {"image": "profile.png", "name": "Ahmad Mohamed"},
    {"image": "profile.png", "name": "Ahmad Mohamed"},
    {"image": "profile.png", "name": "Ahmad Mohamed"},
    {"image": "profile.png", "name": "Ahmad zzzzzzzzzzz"}
  ];
  @override
  Widget build(BuildContext context) {
    return MMScaffold(
        appBarSize: 150,
        appBar: MMAppBar(
          title: "Add people",
          appBarExtends: CmTextField(
            borderColor: const Color(0xFFF2F2F2),
            hintText: "Name or Mobile Number",
            suffixWidget: CmContainer(
              width: widthAccordingRation(context, 81),
              height: 29,
              paddingAll: 7,
              child: CmContainer(
                borderRadiusAll: 16,
                color: primaryColor,
                child: const Center(
                  child: CmText(
                    fontSize: 14,
                    color: Colors.white,
                    text: "Invite",
                    align: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: CmContainer(
                  color: Colors.white,
                  borderRadiusAll: 16,
                  width: widthAccordingRation(context, 341),
                  height: heightAccordingRation(context, 531),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: users.length,
                    itemBuilder: (context, i) {
                      return CmContainer(
                        paddingAll: 15,
                        borderWidthBottom: 1,
                        borderColor: const Color(0xffDFD8D0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                CmContainer(
                                    width: widthAccordingRation(context, 32),
                                    height:
                                    heightAccordingRation(context, 32),
                                    child: Image.asset(
                                        "assets/images/${users[i]["image"]}")),
                                SizedBox(
                                  width: widthAccordingRation(context, 8),
                                ),
                                CmText(
                                  text: users[i]["name"],
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            CmButton(
                                width: widthAccordingRation(context, 86),
                                height: heightAccordingRation(context, 29),
                                backgroundColor: Colors.white,
                                borderColor: const Color(0xffA761C4),
                                borderWidth: 1,
                                padding: 0,
                                borderRadius: 100,
                                child: const CmText(
                                  text: "Remove",
                                  fontSize: 17,
                                  color: Color(0xffA761C4),
                                ))
                          ],
                        ),
                      );
                    },
                  )),
            )
          ],
        ));
  }
}
