import 'package:flutter/material.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_button.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/helpers/widgets/cm_text_field.dart';
import 'package:moment/utils/constants.dart';
import 'package:moment/widgets/mm_app_bar.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:moment/widgets/mm_ship.dart';

class Network extends StatefulWidget {
  const Network({Key? key}) : super(key: key);

  @override
  State<Network> createState() => _NetworkState();
}

class _NetworkState extends State<Network> {
  int selectedNetworkOptionId = 1;
  List networkOptions = [
    {"id": 1, "title": "Connections"},
    {"id": 2, "title": "Followings"},
    {"id": 3, "title": "Followers"}
  ];
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
          title: "Netwrok",
          appBarExtends: CmTextField(
            hintText: "Search Your Connections",
            suffixWidget: CmContainer(
              width: widthAccordingRation(context, 90),
              paddingAll: 7,
              child: CmContainer(
                borderRadiusAll: 100,
                color: primaryColor,
                child: const Center(
                  child: CmText(
                    color: Colors.white,
                    text: "Search",
                    align: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CmContainer(
                height: 64,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: networkOptions.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedNetworkOptionId = networkOptions[i]["id"];
                        });
                      },
                      child: MMShip(
                        onTap: (){},
                        text: networkOptions[i]["title"],
                        backgroundColor:
                            networkOptions[i]["id"] == selectedNetworkOptionId
                                ? primaryColor
                                : Colors.white,
                        color:
                            networkOptions[i]["id"] == selectedNetworkOptionId
                                ? Colors.white
                                : Colors.grey,
                      ),
                    );
                  },
                ),
              ),

              CmContainer(
                  color: Colors.white,
                  borderRadiusAll: 16,
                  width: widthAccordingRation(context, 341),
                  height: heightAccordingRation(context, 531),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          // primary: false,
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
                                      borderColor: Color(0xffA761C4),
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
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
