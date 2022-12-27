import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/screens/settings/profile.dart';
import 'package:moment/utils/constants.dart';
import 'package:moment/utils/functions.dart';
import 'package:moment/widgets/mm_app_bar.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:moment/widgets/create_moment.dart';
import 'package:moment/widgets/mm_text_field.dart';
import 'package:moment/widgets/settings_widgets.dart';

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

  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MMScaffold(
        appBarSize: 150,
        appBar: MMAppBar(
          title: "Network",
          appBarExtends:
          MMTextField(
              width: widthAccordingRation(context, 341),
              controller: searchController,
              text: "Search Your Connections",
              actionText: "Search",
            textContainerWidth: widthAccordingRation(context, 81),
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
                  return ship(
                    width: widthAccordingRation(context, 104),
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
                    String name = networkNames[random.nextInt(networkNames.length)];
                      return networkListItem(
                        name: name,
                        selectedNetworkOptionId: selectedNetworkOptionId,
                        buttonWidth: widthAccordingRation(context, 86),
                        buttonHeight: heightAccordingRation(context, 29),
                        onTap: () {
                          Get.to(()=> Profile(
                            isMyProfile: false,
                            userName: name,
                          ));
                        }
                      );
                    },
                  )),
            )
          ],
        ));
  }

}
