import 'dart:math';

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
  final random = new Random();

  @override
  Widget build(BuildContext context) {
    return MMScaffold(
        appBarSize: 150,
        appBar: MMAppBar(
          title: "Network",
          appBarExtends: CmTextField(
            width: widthAccordingRation(context, 341),
            borderColor: const Color(0xFFF2F2F2),
            hintText: "Search Your Connections",
            suffixWidget: CmContainer(
              width: widthAccordingRation(context, 81),
              height: 19,
              paddingBottom: 10,
              paddingTop: 10,
              marginEnd: 16,
              child: CmContainer(
                borderRadiusAll: 16,
                color: primaryColor,
                child: const Center(
                  child: CmText(
                    color: Colors.white,
                    fontSize: 14,
                    text: "Search",
                    align: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            CmContainer(
              height: 64,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: networkOptions.length,
                itemBuilder: (context, i) {
                  return MMShip(
                    onTap: (){setState(() {
                      selectedNetworkOptionId = networkOptions[i]["id"];
                    });

                    },
                    text: networkOptions[i]["title"],
                    backgroundColor:
                        networkOptions[i]["id"] == selectedNetworkOptionId
                            ? primaryColor
                            : Colors.white,
                    color:
                        networkOptions[i]["id"] == selectedNetworkOptionId
                            ? Colors.white
                            : Colors.grey,
                  );
                },
              ),
            ),

            Expanded(
              child: CmContainer(
                  color: Colors.white,
                  borderRadiusTopEnd: 16,
                  borderRadiusTopStart: 16,
                  width: widthAccordingRation(context, 341),
                  child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                    itemCount: networkNames.length,
                    itemBuilder: (context, i) {
                      return Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CmContainer(
                              paddingTop: 14,
                              paddingStart: 16,
                              paddingEnd: 16,
                              paddingBottom: 14,
                              borderColor: const Color(0xffDFD8D0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        CmContainer(
                                            width: widthAccordingRation(context, 32),
                                            height:
                                                heightAccordingRation(context, 32),
                                            child: Image.asset(
                                                "assets/images/profile.png")),
                                        SizedBox(
                                          width: widthAccordingRation(context, 8),
                                        ),
                                        CmText(
                                          text:networkNames[random.nextInt(networkNames.length)],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ),
                                  CmButton(
                                    marginBottom: 0,
                                      marginTop: 0,
                                      width: widthAccordingRation(context, 86),
                                      height: heightAccordingRation(context, 29),
                                      backgroundColor: Colors.white,
                                      borderColor: const Color(0xffA761C4),
                                      borderWidth: 1,
                                      padding: 0,
                                      borderRadius: 100,
                                      child:  CmText(
                                        text: selectedNetworkOptionId== 2?  "Unfollow":"Remove",
                                        fontSize: 14,
                                        color: Color(0xffA761C4),
                                      ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Divider( thickness: 1,height: 1,color: Color(0xFFF2F2F2)),
                            ),
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
