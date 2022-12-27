import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_button.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/screens/settings/edit_information.dart';
import 'package:moment/screens/settings/settings.dart';
import 'package:moment/screens/search_users.dart';
import 'package:moment/utils/constants.dart';
import 'package:moment/utils/functions.dart';
import 'package:moment/widgets/mm_app_bar.dart';
import 'package:moment/widgets/mm_logo.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:moment/widgets/create_moment.dart';
import 'package:moment/widgets/moments_widgets.dart';

class Profile extends StatefulWidget {
  final bool isMyProfile;
  final String userName;
  const Profile({Key? key, required this.isMyProfile,this.userName= "Ahmed Mohamed"}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  int selectedDate = 0;
  int selectedType = 0;
  String selectedTypeName = categories[0];
  String selectedDay = "";
  String month = "";
  String year = "";

  List days = [];

  bool isConnected = false;

  void onChooseDate(int index) async {
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
    return MMScaffold(
      appBar: MMAppBar(
        leading: InkWell(
          onTap: () {
            Get.to(() => const Settings());
          },
          child: CmContainer(child: Image.asset("assets/images/profile.png")),
        ),
        custom: CmContainer(
          width: widthAccordingRation(context, 148),
          height: heightAccordingRation(context, 41.87),
          child: MMLogo(),
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
      bodyPadding: EdgeInsets.zero,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CmContainer(
              height: 295,
              child: Stack(
                children: [
                  CmContainer(
                    width: width(context),
                    height: 200,
                    child: Image.asset("assets/images/jeddah.jpeg",fit: BoxFit.fill,)),
                  Positioned(
                      bottom: 16,
                      left: 16,
                      child: CmContainer(
                        paddingAll: 16,
                        borderRadiusAll: 16,
                        width: widthAccordingRation(context, 337),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CmContainer(
                                  width: 80,
                                  height: 80,
                                  child:
                                      Image.asset("assets/images/profile.png"),
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CmText(
                                      text: widget.userName,
                                      fontSize: 18,
                                    ),
                                    CmText(
                                      text: "+9661234567890",
                                      fontSize: 14,
                                    ),
                                    CmText(
                                      text: "Member No.11",
                                      color: secondaryColor,
                                      fontSize: 14,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                              ],
                            ),
                            SizedBox(height: 24,),
                            CmButton(
                              onPressed: (){
                                if( widget.isMyProfile) {
                                  Get.to(() => EditInformation());
                                }
                                else {
                                  setState(() {
                                    isConnected = !isConnected;
                                  });
                                }
                              },
                              width: width(context),
                              child: CmText(text:
                              widget.isMyProfile?"Edit Information": isConnected?"Connected":"Connect",
                                color: primaryColor,),
                              backgroundColor: Colors.white,
                              padding: 0,
                              height: 32,
                              borderWidth: 1,
                              borderColor: primaryColor,
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 16, left: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MMMdContainer(
                          text: month,
                        width: widthAccordingRation(context, 165)
                      ),
                      MMMdContainer(text: year,width: widthAccordingRation(context, 165))
                    ],
                  ),

                  SizedBox(
                    height: heightAccordingRation(context, 16),
                  ),
                  CmContainer(
                    height: 88,
                    child: ListView.builder(
                        itemCount: days.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return weekWidget(
                              onTap: () => onChooseDate(index),
                              color: selectedDate == index
                                  ? primaryColor
                                  : Colors.white,
                              textColor: selectedDate == index
                                  ? Colors.white
                                  : const Color(0xFF211522),
                              dayName: days[index]["dayName"],
                              date: days[index]["date"]);
                        }),
                  ),
                  SizedBox(
                    height: heightAccordingRation(context, 16),
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
                          return ship(
                            width: widthAccordingRation(context, 104),
                            text: categories[i],
                            onTap: () {
                              setState(() {
                                selectedType = i;
                                selectedTypeName = categories[i];
                              });
                            },
                            color:
                                selectedType == i ? Colors.white : Colors.grey,
                            backgroundColor:
                                selectedType == i ? primaryColor : Colors.white,
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
                        return moments[selectedTypeName][i]["isAvailable"]
                            ? MMAvailableMoment(
                                time: moments[selectedTypeName][i]["time"],
                                width: width(context),
                        )
                            : MMProfileMoment(
                          width: widthAccordingRation(context, 338),
                                username: moments[selectedTypeName][i]["moment"]
                                    ["username"],
                                momentName: moments[selectedTypeName][i]
                                    ["moment"]["momentName"],
                                type: moments[selectedTypeName][i]["moment"]
                                    ["type"],
                                time: moments[selectedTypeName][i]["time"],
                                location: moments[selectedTypeName][i]["moment"]
                                    ["location"],
                                people: moments[selectedTypeName][i]["moment"]
                                    ["people"],
                              );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget weekWidget(
      {required VoidCallback onTap,
      required Color color,
      required Color textColor,
      required String dayName,
      required String date}) {
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
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: CmText(text: dayName, fontSize: 17, color: textColor),
              ),
              CmText(text: date, fontSize: 32, color: textColor)
              // child,
              // child,
            ],
          ),
        ),
      ),
    );
  }
}
