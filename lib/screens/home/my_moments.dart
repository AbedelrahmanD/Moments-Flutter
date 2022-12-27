import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class MyMoments extends StatefulWidget {
  const MyMoments({Key? key}) : super(key: key);

  @override
  _MyMomentsState createState() => _MyMomentsState();
}

class _MyMomentsState extends State<MyMoments> {

  var now = new DateTime.now();
  int selectedDate=0;
  int selectedType=0;
  String selectedTypeName = categories[0];
  String selectedDay = "";
  String month = "";
  String year = "";

  List days = [];

  void onChooseDate(int index) async{
    setState(() {
      selectedDate = index;
      selectedDay = days[index]["fullDate"];
    });
  }

  @override
  void initState() {
    dynamic data = fillTimeInputs();
    month = data["month"];
    year = data["year"];
    days = data["days"];
    selectedDay = data["selectedDay"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      MMScaffold(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  MMMdContainer(text: df(month),width: widthAccordingRation(context, 165),),
                  MMMdContainer(text: year,width: widthAccordingRation(context, 165),)
                ],
              ),
              SizedBox(
                height: heightAccordingRation(context,16),
              ),
              CmContainer(
                height: 88,
                child: ListView.builder(
                    itemCount: days.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder:
                        (BuildContext context, int index) {
                      return weekWidget(
                        width: widthAccordingRation(context, 104),
                          onTap: () =>
                              onChooseDate(index),
                          color: selectedDate == index
                              ? primaryColor
                              : Colors.white,
                          textColor: selectedDate == index?
                          Colors.white: const Color(0xFF211522),
                          dayName: df(days[index]["dayName"]),
                          date: days[index]["date"]
                      );
                    }),
              ),
              SizedBox(
                height: heightAccordingRation(context,16),
              ),
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
                      return ship(text: df(categories[i]),
                        onTap: (){
                          setState(() {
                            selectedType=i;
                            selectedTypeName = categories[i];
                          });
                        },
                        color: selectedType==i ? Colors.white : Colors.grey,
                        backgroundColor: selectedType==i ? primaryColor : Colors.white, width: widthAccordingRation(context, 104),
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
                    return moments[selectedTypeName][i]["isAvailable"]?
                    MMAvailableMoment(
                        time: moments[selectedTypeName][i]["time"],
                        width: width(context),
                    ):
                    MMTakenMoment(
                      width: width(context),
                      username: moments[selectedTypeName][i]["moment"]["username"],
                      momentName: df(moments[selectedTypeName][i]["moment"]["momentName"]),
                      type: df(moments[selectedTypeName][i]["moment"]["type"]),
                      time: moments[selectedTypeName][i]["time"],
                      location: moments[selectedTypeName][i]["moment"]["location"],
                      people: moments[selectedTypeName][i]["moment"]["people"],
                    );
                  }),
            ],
          ),
        ),
      )
    ;
  }

}
