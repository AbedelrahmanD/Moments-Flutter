import 'package:flutter/material.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/screens/inbox.dart';
import 'package:moment/screens/my_moments.dart';
import 'package:moment/screens/people_moments.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

    int pageIndex = 0;

    final pages = [
      const MyMoments(),
      const PeopleMoments(),
      const Inbox(),
    ];

    Widget buildMyNavBar(BuildContext context) {
      return CmContainer(
        height: 80,
        color: Colors.white,
        borderRadiusTopStart: 16,
        borderRadiusTopEnd: 16,
          borderColor: Color(0xFFDFD8D0),
          borderWidthAll: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              enableFeedback: false,
              onTap: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    color: pageIndex == 0? Color(0xFF613659) :Color(0x536D407D),
                    size: 35,
                  ),
                  CmText(text: "My\n Moments",color: pageIndex == 0? Color(0xFF613659) :Color(0x536D407D),fontSize: 12,align: TextAlign.center,)
                ],
              ),
            ),
            InkWell(
              enableFeedback: false,
              onTap: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.people,
                    color: pageIndex == 1? Color(0xFF613659) :Color(0x536D407D),
                    size: 35,
                  ),
                  CmText(text: "People\n Moments",color: pageIndex == 1? Color(0xFF613659) :Color(0x536D407D),fontSize: 12,align: TextAlign.center,)
                ],
              ),
            ),
            InkWell(
              enableFeedback: false,
              onTap: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.inbox,
                    color: pageIndex == 2? Color(0xFF613659) :Color(0x536D407D),
                    size: 35,
                  ),
                  CmText(text: "Inbox",color: pageIndex == 2? Color(0xFF613659) :Color(0x536D407D),fontSize: 12,align: TextAlign.center,)
                ],
              ),
            ),
          ],
        ),
      );
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Color(0xffF2F2F2),
        body:  IndexedStack(
      index: pageIndex,
      children: pages,
    ),
        bottomNavigationBar: buildMyNavBar(context),

    );

  }

}
