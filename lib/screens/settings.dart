import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/screens/network.dart';
import 'package:moment/screens/profile.dart';
import 'package:moment/screens/search.dart';
import 'package:moment/screens/static_page.dart';
import 'package:moment/utils/constants.dart';
import 'package:moment/widgets/mm_app_bar.dart';
import 'package:moment/widgets/mm_logo.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:get/get.dart';
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
      "navigate":const Profile(),
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
                Get.to(()=> const Search());
              }, icon: const Icon(Icons.search,size: 16,color: Color(0x3C3C434D),),),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CmContainer(
                  // width: width(context),
                  width: widthAccordingRation(context, 339),
                  // height: heightAccordingRation(context, 250),
                  borderRadiusAll: 16,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 32,
                      ),
                      CmContainer(
                          width: widthAccordingRation(context, 104),
                          height: heightAccordingRation(context, 104),
                          child: Image.asset("assets/images/profile.png")),
                      SizedBox(
                        height: 8,
                      ),
                      const CmText(
                        text: "Dr. Zaidan Alenezi",
                        fontSize: 28,
                        align: TextAlign.center,
                      ),
                      SizedBox(
                         height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CountryPickerUtils.getDefaultFlagImage(CountryPickerUtils.getCountryByPhoneCode('966')),
                          SizedBox(width: 6,),
                          const CmText(
                            text: "+966506284840",
                            fontSize: 18,
                            align: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
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
                     )

                      // for(dynamic option in profileOptions)
                      //   CmContainer(
                      //     paddingAll: 15,
                      //
                      //     borderWidthBottom: 1,
                      //       borderColor: Colors.grey,
                      //       child: Row(children: [
                      //     Image.asset("assets/images/${option['image']}"),
                      //     SizedBox(width: widthAccordingRation(context, 8),),
                      //     CmText(text: option['title'],fontSize: 20,)
                      //   ],))
                    ],
                  ))
            ],
          ),
        ));
  }
}
