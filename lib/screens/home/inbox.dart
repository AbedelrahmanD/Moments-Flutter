import 'package:flutter/material.dart';

import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/screens/search_users.dart';
import 'package:moment/widgets/mm_app_bar.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:get/get.dart';
import 'package:moment/widgets/moments_widgets.dart';

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
                Get.to(() => const SearchUsers());
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
            return inboxWidget(
                index: i,
                name: inboxes[i]["name"],
                message: inboxes[i]["message"],
                location: inboxes[i]["location"],
                date: inboxes[i]["date"],
                time: inboxes[i]["time"],
            );
          }),
    );
  }
}
