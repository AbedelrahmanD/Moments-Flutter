
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/screens/create_moment/invite_people.dart';
import 'package:moment/screens/create_moment/map_view.dart';
import 'package:moment/utils/functions.dart';
import 'package:moment/widgets/alert_box.dart';
import 'package:moment/widgets/mm_app_bar.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:moment/widgets/create_moment.dart';
import 'package:moment/widgets/moments_widgets.dart';

class CreateMoment extends StatefulWidget {
  const CreateMoment({Key? key}) : super(key: key);

  @override
  CreateMomentState createState() => CreateMomentState();
}

class CreateMomentState extends State<CreateMoment> {
  TextEditingController titleController = TextEditingController();
  String title = "Title";

  TextEditingController timeController = TextEditingController();
  String time = "00:00 - 01:00";

  final ScrollController _controller= ScrollController(keepScrollOffset: true);

  List categories = [
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
  List repeatsList = [
    "DAILY",
    "MON",
    "TUE",
    "WED",
    "THU",
    "FRI",
    "SAT",
    "SUN",
  ];

  String selectedCategory = "";
  int selectedCategoryIndex = 0;
  List chosenRepeats = [];

  bool isOpen = false;
  bool isPublic = false;


  @override
  void initState() {
    selectedCategory= categories[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MMScaffold(
      bodyPadding: EdgeInsets.only(top: 16),
        appBar: MMAppBar(
          title: "Sunday March 8, 2021",
          actions: [
            Center(
              child: InkWell(
                onTap: () {},
                child: CmContainer(
                  width: widthAccordingRation(context, 81),
                  height: 24,
                  borderRadiusAll: 16,
                  borderWidthAll: 1,
                  borderColor: const Color(0xFF211522),
                  child: const Center(child: CmText(text: "Change")),
                ),
              ),
            )
          ],
        ),
        //https://github.com/flutter/flutter/issues/18711#issuecomment-505791677
        body: LayoutBuilder (builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CmContainer(
                        color: Colors.white,
                        width: width(context),
                        paddingAll: 16,
                        borderRadiusAll: 16,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      showAlertFillData(
                                        onPressed: (){
                                          if(titleController.text.isNotEmpty){
                                            title = titleController.text;
                                          }
                                          setState(() {

                                          });
                                          Get.back();
                                        },
                                        controller: titleController,
                                        buttonWidth: widthAccordingRation(context, 104),
                                        width: widthAccordingRation(context, 308),
                                        placeholder: "Title",
                                      );
                                    },
                                    child: CmText(
                                      text: title,
                                      fontSize: 24,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showAlertNoAction(
                                        shipWidth: widthAccordingRation(context, 104),
                                        index: selectedCategoryIndex,
                                        controller: _controller,
                                        widget: CmContainer(
                                        height: 40,
                                        child: ListView.builder(
                                            controller: _controller,
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            physics: const BouncingScrollPhysics(),
                                            itemCount: categories.length,
                                            itemBuilder: (context, i) {
                                              return ship(
                                                width: widthAccordingRation(context, 104)-8,
                                                text: categories[i],

                                                onTap: () {
                                                  selectedCategoryIndex = i;
                                                  selectedCategory = categories[i];
                                                  setState(() {});
                                                  Get.back();
                                                },
                                                marginTop: 8,
                                                marginBottom: 8,
                                                color: selectedCategory == categories[i] ? Colors.white : const Color(
                                                    0xFF625A63),
                                                backgroundColor: selectedCategory == categories[i]
                                                    ? primaryColor
                                                    : Colors.white,
                                              );
                                            }),
                                      ),);
                                    },
                                    child: CmContainer(
                                      color: const Color(0xFFDEDEDE),
                                      borderRadiusAll: 16,
                                      width: 104,
                                      height: 24,
                                      child:  Center(
                                          child: CmText(
                                            text: selectedCategory,
                                            fontSize: 12,
                                            align: TextAlign.center,
                                          )),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Get.to(()=>MapView());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CmContainer(
                                      width: 14.0,
                                      height: 14.0,
                                      child: Image.asset("assets/images/pin.png"),),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const CmText(
                                      text: "Location",
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              InkWell(
                                onTap: (){
                                  showAlertFillData(
                                    onPressed: (){
                                      if(timeController.text.isNotEmpty){
                                        time = timeController.text;
                                      }
                                      setState(() {

                                      });
                                      Get.back();
                                    },
                                    controller: timeController,
                                    buttonWidth: widthAccordingRation(context, 104),
                                    width: widthAccordingRation(context, 308),
                                    placeholder: "Time",
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CmContainer(
                                      width: 14.0,
                                      height: 14.0,
                                      child: Image.asset("assets/images/wallClock.png"),),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                     CmText(
                                      text: time,
                                      fontSize: 16,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              InkWell(
                                onTap: (){
                                  Get.to(()=>const InvitePeople());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CmContainer(
                                      width: 14.0,
                                      height: 14.0,
                                      child: Image.asset("assets/images/people.png"),),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    const CmText(
                                        text: "Invite",
                                        fontSize: 16,
                                        decoration: TextDecoration.underline)
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  CmText(
                                    text: "Repeat",
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                              CmContainer(
                                height: 40,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: repeatsList.length,
                                    itemBuilder: (context, i) {
                                      return ship(
                                        width: widthAccordingRation(context, 72),
                                        text: repeatsList[i],
                                        onTap: () {
                                          if(i==0){
                                            if(chosenRepeats.contains(0)){
                                              chosenRepeats.removeRange(
                                                  0, chosenRepeats.length);
                                            }
                                            else {
                                              chosenRepeats.removeRange(
                                                  0, chosenRepeats.length);
                                              List allIndex = [0,1,2,3,4,5,6,7];
                                              chosenRepeats.addAll(allIndex);
                                            }
                                          }
                                          else {
                                            if(chosenRepeats.contains(i)){
                                              chosenRepeats.remove(0);
                                              chosenRepeats.remove(i);
                                            }
                                            else{
                                              chosenRepeats.add(i);
                                            }
                                          }
                                          setState(() {});
                                        },
                                        marginTop: 8,
                                        marginBottom: 8,
                                        color: chosenRepeats.contains(i) ? Colors.white : const Color(
                                            0xFF625A63),
                                        backgroundColor: chosenRepeats.contains(i)
                                            ? primaryColor
                                            : const Color(0xFFF2F2F2),
                                      );
                                    }),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  CmText(
                                    text: "Can People join?",
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                              CmContainer(
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ship(
                                      width: widthAccordingRation(context, 72),
                                      marginTop: 8,
                                      marginBottom: 8,
                                      text: "Open",
                                      onTap: () {
                                        setState(() {
                                          isOpen = true;
                                        });
                                      },
                                      color: isOpen ? Colors.white : const Color(
                                          0xFF625A63),
                                      backgroundColor: isOpen
                                          ? primaryColor
                                          : const Color(0xFFF2F2F2),
                                    ),
                                    ship(
                                      width: widthAccordingRation(context, 72),
                                      marginTop: 8,
                                      marginBottom: 8,
                                      text: "Invited",
                                      onTap: () {
                                        setState(() {
                                          isOpen = false;
                                        });
                                      },
                                      color: !isOpen ? Colors.white : const Color(
                                          0xFF625A63),
                                      backgroundColor: !isOpen
                                          ? primaryColor
                                          : const Color(0xFFF2F2F2),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  CmText(
                                    text: "Privacy",
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                              CmContainer(
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ship(
                                      width: widthAccordingRation(context, 72),
                                      marginTop: 8,
                                      marginBottom: 8,
                                      text: "Public",
                                      onTap: () {
                                        setState(() {
                                          isPublic = true;
                                        });
                                      },
                                      color: isPublic ? Colors.white : const Color(
                                          0xFF625A63),
                                      backgroundColor: isPublic
                                          ? primaryColor
                                          : const Color(0xFFF2F2F2),
                                    ),
                                    ship(
                                      width: widthAccordingRation(context, 72),
                                      marginTop: 8,
                                      marginBottom: 8,
                                      text: "Private",
                                      onTap: () {
                                        setState(() {
                                          isPublic = false;
                                        });
                                      },
                                      color: !isPublic ? Colors.white : const Color(
                                          0xFF625A63),
                                      backgroundColor: !isPublic
                                          ? primaryColor
                                          : const Color(0xFFF2F2F2),
                                    ),

                                  ],
                                ),
                              ),
                              // Container(
                              //   height: 50,
                              //   child: ListView.builder(
                              //       controller: _controller,
                              //       scrollDirection: Axis.horizontal,
                              //       shrinkWrap: true,
                              //       physics: const BouncingScrollPhysics(),
                              //       itemCount: categories.length,
                              //       itemBuilder: (context, i) {
                              //         return ship(
                              //           width: widthAccordingRation(context, 104),
                              //           text: categories[i],
                              //           onTap: () {
                              //             selectedCategory = categories[i];
                              //             setState(() {});
                              //             Get.back();
                              //           },
                              //           marginTop: 8,
                              //           marginBottom: 8,
                              //           color: selectedCategory == categories[i] ? Colors.white : const Color(
                              //               0xFF625A63),
                              //           backgroundColor: selectedCategory == categories[i]
                              //               ? primaryColor
                              //               : Colors.white,
                              //         );
                              //       }),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        height: 25,
                      ),
                    ),
                    bottomButton(
                      context: context,
                      text: "Create Moment",
                      onPress: (){
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }),);
  }
}
