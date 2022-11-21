import 'package:flutter/material.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_button.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/helpers/widgets/cm_text_field.dart';
import 'package:moment/utils/constants.dart';
import 'package:moment/widgets/alert_box.dart';
import 'package:moment/widgets/mm_app_bar.dart';
import 'package:moment/widgets/mm_scaffold.dart';

class InvitePeople extends StatefulWidget {
  const InvitePeople({Key? key}) : super(key: key);

  @override
  InvitePeopleState createState() => InvitePeopleState();
}

class InvitePeopleState extends State<InvitePeople> {
  List users = [
    {
      "image": "profile.png",
      "name": "Ahmad Mohamed",
      "available": true,
      "value": false
    },
    {
      "image": "profile.png",
      "name": "Ahmad Mohamed",
      "available": true,
      "value": false
    },
    {
      "image": "profile.png",
      "name": "Ahmad Mohamed",
      "available": true,
      "value": false
    },
    {
      "image": "profile.png",
      "name": "Ahmad Mohamed",
      "available": true,
      "value": false
    },
    {
      "image": "profile.png",
      "name": "Ahmad Mohamed",
      "available": false,
      "value": false
    },
    {
      "image": "profile.png",
      "name": "Ahmad Mohamed",
      "available": false,
      "value": false
    },
    {
      "image": "profile.png",
      "name": "Ahmad Mohamed",
      "available": false,
      "value": false
    },
    {
      "image": "profile.png",
      "name": "Ahmad Mohamed",
      "available": false,
      "value": false
    },
    {
      "image": "profile.png",
      "name": "Ahmad Mohamed",
      "available": false,
      "value": false
    },
    {
      "image": "profile.png",
      "name": "Ahmad Mohamed",
      "available": true,
      "value": false
    },
    {
      "image": "profile.png",
      "name": "Ahmad Mohamed",
      "available": true,
      "value": false
    },
    {
      "image": "profile.png",
      "name": "Ahmad Mohamed",
      "available": true,
      "value": false
    },
    {
      "image": "profile.png",
      "name": "Ahmad Mohamed",
      "available": true,
      "value": false
    },
    {
      "image": "profile.png",
      "name": "Ahmad Mohamed",
      "available": true,
      "value": false
    },
    {
      "image": "profile.png",
      "name": "Ahmad Mohamed",
      "available": true,
      "value": false
    },
    {
      "image": "profile.png",
      "name": "Ahmad zzzzzzzzzzz",
      "available": true,
      "value": false
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MMScaffold(
        appBarSize: 150,
        appBar: MMAppBar(
          title: "Add people",
          appBarExtends: CmTextField(
            width: widthAccordingRation(context, 341),
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
                  borderRadiusTopEnd: 16,
                  borderRadiusTopStart: 16,
                  width: widthAccordingRation(context, 341),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: users.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          CheckboxListTile(

                            checkboxShape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            value: users[i]["value"],
                            onChanged: (bool? value) {
                              setState(() {
                                users[i]["value"] = value;
                              });
                            },
                            secondary: CmContainer(
                                width: widthAccordingRation(context, 32),
                                height: heightAccordingRation(context, 32),
                                child: Image.asset(
                                    "assets/images/${users[i]["image"]}")),
                            title: CmText(
                              text: users[i]["name"],
                              fontSize: 17,
                            ),
                            subtitle: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 12,
                                  color: users[i]["available"]
                                      ? primaryColor
                                      : Color(0xFFDFD8D0),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                CmText(
                                  text: users[i]["available"]
                                      ? "Available"
                                      : "Not Available",
                                  fontSize: 12,
                                ),
                              ],
                            ),
                            side: BorderSide(
                                color: Color(0xFFC7C7CC), style: BorderStyle.solid),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Divider( thickness: 1,height: 1,color: Color(0xFFF2F2F2)),
                          ),
                        ],
                      );
                    },
                  ),
              ),
            ),
          ],
        ),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }
  Widget buildMyNavBar(BuildContext context) {
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
            padding: 0,
            marginBottom: 0,
            marginTop: 0,
            height: 48,
            width: widthAccordingRation(context, 164),
            child: CmText(
              text: "Invite",
              color: Colors.white,
              fontSize: 24,
            ),
          ), 
          CmButton(
            onPressed: (){
              showAlertCheckAvailableDate(buttonWidth: width(context,value: 0.35));
            },
            backgroundColor: Colors.white,
            padding: 0,
            marginBottom: 0,
            marginTop: 0,
            height: 48,
            width: widthAccordingRation(context, 164),
            borderColor: primaryColor,
            child: CmText(
              text: "Check \n Availability",
              color: primaryColor,
              fontSize: 18,
              align: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
