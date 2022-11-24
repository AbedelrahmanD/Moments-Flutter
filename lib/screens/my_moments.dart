import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/screens/settings.dart';
import 'package:moment/screens/search.dart';
import 'package:moment/utils/constants.dart';
import 'package:moment/widgets/home/mm_available_moment.dart';
import 'package:moment/widgets/home/mm_md_container.dart';
import 'package:moment/widgets/home/mm_taken_moment.dart';
import 'package:moment/widgets/mm_app_bar.dart';
import 'package:moment/widgets/mm_logo.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:moment/widgets/mm_ship.dart';

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
  int pageIndex = 0;
  generateOneWeekForward () {

    var monthFormatter = new DateFormat('MMMM');
    var yearFormatter = new DateFormat('yyyy');
    month = monthFormatter.format(now);
    year = yearFormatter.format(now);

    var fullDateFormatter = new DateFormat('EEEE MMMM dd, y');
    var dayNameFormatter = new DateFormat('EEEE');
    var dateFormatter = new DateFormat('dd');
    for(int i=0;i<7;i++){
      final nextDay = DateTime(now.year, now.month, now.day + i);
      days.add( {
        "dayName": i==0 ? "Today" :dayNameFormatter.format(nextDay),
        "date":dateFormatter.format(nextDay),
        "fullDate":fullDateFormatter.format(nextDay)},);
    }
    selectedDay = days[0]["fullDate"];
  }

  @override
  void initState() {
    generateOneWeekForward();
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
            child: const MMLogo(),
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
                Get.to(()=> const Search());
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
                  MMMdContainer(text: month),
                  MMMdContainer(text: year)
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
                          onTap: () =>
                              onChooseDate(index),
                          color: selectedDate == index
                              ? primaryColor
                              : Colors.white,
                          textColor: selectedDate == index?
                          Colors.white: const Color(0xFF211522),
                          dayName: days[index]["dayName"],
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
                color: Color(0xFF613659),
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
                      return MMShip(text: categories[i],
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
                    return moments[selectedTypeName][i]["isAvailable"]?
                    MMAvailableMoment(time: moments[selectedTypeName][i]["time"]):
                    MMTakenMoment(
                      username: moments[selectedTypeName][i]["moment"]["username"],
                      momentName: moments[selectedTypeName][i]["moment"]["momentName"],
                      type: moments[selectedTypeName][i]["moment"]["type"],
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
  Widget weekWidget (
      {
        required VoidCallback onTap,
        required Color color,
        required Color textColor,
        required String dayName,
        required String date
      }
      ) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: onTap,
        child: CmContainer(
          color: color,
          width: widthAccordingRation(context, 104),
          height: 88,
          borderRadiusAll: 16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:  [
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: CmText(text: dayName,fontSize: 17,color: textColor),
              ),
              CmText(text: date,fontSize: 32,color: textColor)
              // child,
              // child,
            ],
          ),
        ),
      ),
    );
  }
}
