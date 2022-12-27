import 'package:flutter/material.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/helpers/widgets/cm_text_field.dart';
import 'package:moment/utils/functions.dart';
import 'package:moment/widgets/create_moment.dart';
import 'package:moment/widgets/mm_app_bar.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:moment/widgets/mm_text_field.dart';

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
      "name": "Ahmad z",
      "available": true,
      "value": false
    }
  ];

  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MMScaffold(
      appBarSize: 150,
      appBar: MMAppBar(
        title: "Add people",
        appBarExtends:
        MMTextField(
            width: widthAccordingRation(context, 341),
            controller: searchController,
            text: "Name or Mobile Number",
            actionText: "Invite",
          textContainerWidth: widthAccordingRation(context, 81),
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
                  return peopleListItem(
                      onChanged: (bool? value) {
                        setState(() {
                          users[i]["value"] = value;
                        });
                      },
                      value: users[i]["value"],
                      name: users[i]["name"],
                      image: "assets/images/${users[i]["image"]}",
                      isAvailable: users[i]["available"]
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: inviteAndCheckAvailabilityNavBar(context),
    );
  }
}
