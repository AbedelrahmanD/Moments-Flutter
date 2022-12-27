import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/screens/settings/settings.dart';
import 'package:moment/screens/search_users.dart';
import 'package:moment/utils/constants.dart';
import 'package:moment/utils/functions.dart';
import 'package:moment/widgets/mm_app_bar.dart';
import 'package:moment/widgets/mm_logo.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:moment/widgets/create_moment.dart';
import 'package:moment/widgets/moments_widgets.dart';

class PeopleMoments extends StatefulWidget {
  const PeopleMoments({Key? key}) : super(key: key);

  @override
  _PeopleMomentsState createState() => _PeopleMomentsState();
}

class _PeopleMomentsState extends State<PeopleMoments> {
  var now = new DateTime.now();
  int selectedType=0;
  String selectedTypeName = categories[0];
  String selectedDay = "";

  final random = new Random();

  @override
  void initState() {
    var fullDateFormatter = new DateFormat('EEEE MMMM dd, y');
    selectedDay = fullDateFormatter.format(now);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return   MMScaffold(
      appBar: MMAppBar(
        leading:     InkWell(
          onTap: (){
            Get.to(()=> const
            Settings());
          },
          child: CmContainer(
              child: Image.asset("assets/images/profile.png")),
        ),
        custom: CmContainer(
          width: widthAccordingRation(context, 148),
          height: heightAccordingRation(context, 41.87),
          child: MMLogo(),
        ),
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
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            CmText(
              text: selectedDay,
              isFitted: true,
              color: secondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            CmContainer(
              height: 64,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: categories.length,
                  itemBuilder: (context, i) {
                    return ship(text: categories[i],
                      width: widthAccordingRation(context, 104),
                      onTap: (){
                        setState(() {
                          selectedType=i;
                          selectedTypeName = categories[i];
                        });
                      },
                      color: selectedType==i ? Colors.white : Colors.grey,
                      backgroundColor: selectedType==i ? primaryColor : Colors.white,
                    );
                  }),
            ),
            // SizedBox(
            //   height: heightAccordingRation(context,16),
            // ),
            ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: moments[selectedTypeName].length,
                itemBuilder: (context, i) {
                  return
                  MMPeopleMomentJoin(
                    width: width(context),
                    username: networkNames[random.nextInt(networkNames.length)],
                    momentName: moments[selectedTypeName][i]["moment"]["momentName"],
                    type: moments[selectedTypeName][i]["moment"]["type"],
                    time: moments[selectedTypeName][i]["time"],
                    location: moments[selectedTypeName][i]["moment"]["location"],
                    people: moments[selectedTypeName][i]["moment"]["people"],
                    canJoin: moments[selectedTypeName][i]["isAvailable"],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
