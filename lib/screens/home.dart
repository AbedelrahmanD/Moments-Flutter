import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/screens/profile.dart';
import 'package:moment/screens/search.dart';
import 'package:moment/utils/constants.dart';
import 'package:moment/widgets/home/mm_available_moment.dart';
import 'package:moment/widgets/home/mm_md_container.dart';
import 'package:moment/widgets/home/mm_taken_moment.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:moment/widgets/mm_app_bar.dart';
import 'package:moment/widgets/mm_logo.dart';
import 'package:moment/widgets/mm_ship.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    int selectedDate=0;
    int selectedType=0;
  List categories = [
    "All",
    "Personal",
    "Business",
    "Restaurant",
    "Cafe",
    "Social",
    "Sport",
    "Entertainment",
    "Appointment",
    "Travel"
  ];

  List days = [
    {"dayName":"Monday","date":"7"},
    {"dayName":"Today","date":"8"},
    {"dayName":"Wednesday","date":"9"},
    {"dayName":"Thursday","date":"10"},
    {"dayName":"Friday","date":"11"},
    {"dayName":"Saturday","date":"12"},
    {"dayName":"Sunday","date":"13"}
  ];

  List moments =[
    {
    "time":"00:00 - 01:30",
      "isAvailable": false,
      "moment": {"username":"Dr. Zaidan Alenezi",
                "momentName":"Watch the match",
                "type":"Entertainment",
                "location":"VOX Cinema - Red Sea Mall",
                "people":"12 People"}
    },
    {
      "time":"01:30 - 02:00",
      "isAvailable": true,
      "moment": null
    },
    {
      "time":"02:00 - 04:30",
      "isAvailable": false,
      "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Watch the match","type":"Entertainment","location":"Al Rabeea Café - Jeddah","people":"12 People"}
    },
    {
      "time":"05:00 - 06:00",
      "isAvailable": true,
      "moment": null
    },
    {
      "time":"06:00 - 07:00",
      "isAvailable": true,
      "moment": null
    },
    {
      "time":"07:00 - 08:00",
      "isAvailable": true,
      "moment": null
    },
    {
      "time":"08:00 - 11:00",
      "isAvailable": false,
      "moment": {"username":"Dr. Zaidan Alenezi","momentName":"Business Meeting","type":"Business","location":"Business Park","people":"12 People"}
    },
  ];

    void onChooseDate(int index) async{
    setState(() {
      selectedDate = index;
    });
  }
    int pageIndex = 0;

    final pages = [
      // const Page1(),
      // const Page2(),
      // const Page3(),
      // const Page4(),
    ];

    Container buildMyNavBar(BuildContext context) {
      return Container(
        height: 80,
        decoration:const BoxDecoration(
          color: Colors.white,
          borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? const Icon(
                Icons.home_filled,
                color: primaryColor,
                size: 35,
              )
                  : const Icon(
                Icons.home_outlined,
                color: primaryColor,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                Icons.work_rounded,
                color: primaryColor,
                size: 35,
              )
                  : const Icon(
                Icons.work_outline_outlined,
                color: primaryColor,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? const Icon(
                Icons.widgets_rounded,
                color: primaryColor,
                size: 35,
              )
                  : const Icon(
                Icons.widgets_outlined,
                color: primaryColor,
                size: 35,
              ),
            ),
          ],
        ),
      );
    }


  @override
  Widget build(BuildContext context) {


    return MMScaffold(
        appBar: MMAppBar(
          leading:     InkWell(
            onTap: (){
              Get.to(()=> const
              Profile());
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
                children: const [
                  MMMdContainer(text: "September"),
                  MMMdContainer(text: "2021")
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
              const CmText(
                text: "Sunday March 8, 2021",
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
                  itemCount: moments.length,
                  itemBuilder: (context, i) {
                    return moments[i]["isAvailable"]?
                    MMAvailableMoment(time: moments[i]["time"]):
                    MMTakenMoment(
                      username: moments[i]["moment"]["username"],
                      momentName: moments[i]["moment"]["momentName"],
                      type: moments[i]["moment"]["type"],
                      time: moments[i]["time"],
                      location: moments[i]["moment"]["location"],
                      people: moments[i]["moment"]["people"],
                    );
                  }),
            ],
          ),
        ),
        bottomNavigationBar: buildMyNavBar(context),
    );

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
