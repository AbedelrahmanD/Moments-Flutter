import 'package:flutter/material.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/screens/search_users.dart';
import 'package:moment/screens/settings/network.dart';
import 'package:moment/screens/settings/profile.dart';
import 'package:moment/screens/settings/static_page.dart';
import 'package:moment/utils/functions.dart';
import 'package:moment/widgets/mm_app_bar.dart';
import 'package:moment/widgets/mm_logo.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:get/get.dart';
import 'package:moment/widgets/settings_widgets.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List profileOptions = [
    {
      "icon": Icons.person,
      "title": "Profile",
      "navigate":const Profile(isMyProfile: true),
    },
    {
      "icon": Icons.people,
      "title": "Network",
      "navigate":const Network(),
    },
    {
      "icon": Icons.document_scanner,
      "title": "Term of Services",
      "navigate":const StaticPage(id: 2),
    },
    {
      "icon": Icons.menu_book_sharp,
      "title": "About",
      "navigate":const StaticPage(id: 1),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MMScaffold(
        appBar: MMAppBar(
          custom: MMLogo(width: widthAccordingRation(context, 148)),
          actions:  [
            Container(
              height: 32.0,
              width: 32.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF2F2F2),
              ),
              child:  IconButton(onPressed: (){
                Get.to(()=> const SearchUsers());
              }, icon: const Icon(Icons.search,size: 16,color: Color(0x3C3C434D),),),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              settingsProfileInformationBox(
                width: widthAccordingRation(context, 339),
                image: "assets/images/profile.png",
                name: "Dr. Zaidan Alenezi",
                countryCode: '966',
                phoneNumber: "+966506284840",
              ),
              SizedBox(
                height: 16,
              ),
              CmContainer(
                  paddingAll: 16,
                  width: widthAccordingRation(context, 339),
                  color: Colors.white,
                  borderRadiusAll: 16,
                  child: Column(
                    children: [
                     ListView.builder(
                       physics: BouncingScrollPhysics(),
                       shrinkWrap: true,
                       itemCount: profileOptions.length,
                       itemBuilder: (context, i) {
                         return InkWell(
                           onTap: (){
                             Get.to(profileOptions[i]["navigate"]);
                           },
                           child: CmContainer(
                             paddingBottom: i==profileOptions.length-1?0: 14,
                               paddingTop: i==0? 0:14,
                               borderWidthBottom: i==profileOptions.length-1?0: 1,
                               borderColor: const Color(0xffDFD8D0),
                               child: Row(
                                 children: [
                                   Icon(profileOptions[i]['icon'],color: Color(0xFF211522),),
                                   SizedBox(
                                     width: widthAccordingRation(context, 8),
                                   ),
                                   CmText(
                                     text: profileOptions[i]['title'],
                                     fontSize: 20,

                                   )
                                 ],
                               )),
                         );
                       },
                     ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
