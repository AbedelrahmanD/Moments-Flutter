import 'package:flutter/material.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
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
  List categories = [
    "All",
    "Appointment",
    "Sport",
    "Socials",
    "Travel",
    "Reservations",
    "Virtual"
  ];

  @override
  Widget build(BuildContext context) {
    return MMScaffold(
        appBar: MMAppBar(
          custom: CmContainer(
            width: 150,
            child: const MMLogo(),
          ),
          actions: const [
            Icon(
              Icons.person,
              color: Colors.black,
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CmText(
              text: "Sunday March 8, 2021",
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            CmContainer(
              height: 30,
              marginBottom: 20,
              marginTop: 20,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, i) {
                    return MMShip(text: categories[i],
                      color: i == 0 ? Colors.white : Colors.grey,
                      backgroundColor: i == 0 ? primaryColor : Colors.white,
                    );
                  }),
            ),

          ],
        ));
  }
}
