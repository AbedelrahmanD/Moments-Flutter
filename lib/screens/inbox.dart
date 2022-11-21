import 'package:flutter/material.dart';

import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_button.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/screens/search.dart';
import 'package:moment/widgets/mm_app_bar.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:get/get.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  List inboxes = [
    {
      "id": 1,
      "name": "Tarek Shawki",
      "message": "Invites you to social moment Watch the prestige.",
      "location": "VOX Cinema - Red Sea Mall",
      "date": "Sunday March 8, 2021",
      "time": "00:00 - 01:30"
    },
    {
      "id": 1,
      "name": "Tarek Shawki",
      "message": "Invites you to social moment Watch the prestige.",
      "location": "VOX Cinema - Red Sea Mall",
      "date": "Sunday March 8, 2021",
      "time": "00:00 - 01:30"
    },
    {
      "id": 2,
      "name": "Tarek Shawki",
      "message": "Invites you to social moment Watch the prestige.",
      "location": "VOX Cinema - Red Sea Mall",
      "date": "Sunday March 8, 2021",
      "time": "00:00 - 01:30"
    },
    {
      "id": 3,
      "name": "Tarek Shawki",
      "message": "Invites you to social moment Watch the prestige.",
      "location": "VOX Cinema - Red Sea Mall",
      "date": "Sunday March 8, 2021",
      "time": "00:00 - 01:30"
    },
    {
      "id": 4,
      "name": "Tarek Shawki",
      "message": "Invites you to social moment Watch the prestige.",
      "location": "VOX Cinema - Red Sea Mall",
      "date": "Sunday March 8, 2021",
      "time": "00:00 - 01:30"
    },
    {
      "id": 5,
      "name": "Tarek Shawki",
      "message": "Invites you to social moment Watch the prestige.",
      "location": "VOX Cinema - Red Sea Mall",
      "date": "Sunday March 8, 2021",
      "time": "00:00 - 01:30"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MMScaffold(
      appBar: MMAppBar(
        centerTitle: false,
        custom: const CmText(
          text: "Inbox",
          fontSize: 34,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          Container(
            height: 32.0,
            width: 32.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF2F2F2),
            ),
            child: IconButton(
              onPressed: () {
                Get.to(() => const Search());
              },
              icon: const Icon(
                Icons.search,
                size: 16,
                color: Color(0x3C3C434D),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: inboxes.length,
          itemBuilder: (context, i) {
            return CmContainer(
                marginTop: 8,
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
                            text: inboxes[i]["name"]+" ",
                            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                            children: [

                              TextSpan(
                                text:  inboxes[i]["message"],
                                style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),
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
                          text: inboxes[i]["location"],
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
                              text: inboxes[i]["date"],
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
                              text: inboxes[i]["time"],
                              fontSize: 16,
                            ),],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: const [
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
                              borderColor: Color(0xff613659),
                              borderWidth: 1,
                              borderRadius: 100,
                              child: CmText(
                                text: "Decline",
                                color: Color(0xff613659),
                              )),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                  ],
                ));
          }),
    );
  }
}
