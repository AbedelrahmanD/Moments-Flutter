import 'package:flutter/material.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_button.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/utils/functions.dart';
import 'package:moment/widgets/alert_box.dart';

Widget ship ({
  required double width,
  double height = 24,
  required String text,
  required VoidCallback onTap,
  Color? backgroundColor,
  Color? color,
  double marginBottom =24,
  double marginTop= 16,
}
    ) {
  return InkWell(
    onTap: onTap,
    child: CmContainer(
      marginBottom: marginBottom,
      marginTop: marginTop,
      child: CmContainer(
          width:width,
          height: height,
          color:backgroundColor??primaryColor,
          borderRadiusAll: 16,
          marginEnd: 8,
          child: Center(
            child: CmText(
              text: text,
              fontSize: 14,
              color:color?? Colors.white,
              align: TextAlign.center,
            ),
          )),
    ),
  );
}

Widget peopleListItem(
    {required bool value, required void Function(bool?)? onChanged,required String name,required String image
      ,required bool isAvailable}) {
  return Column(
    children: [
      CheckboxListTile(
        activeColor: primaryColor,
        checkboxShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        value: value,
        onChanged: onChanged,
        secondary: CmContainer(
            width: 32,
            height: 32,
            child: Image.asset(image)),
        title: CmText(
          text: name,
          fontSize: 17,
        ),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.circle,
              size: 12,
              color: isAvailable ? primaryColor : Color(0xFFDFD8D0),
            ),
            SizedBox(
              width: 4,
            ),
            CmText(
              text: isAvailable ? "Available" : "Not Available",
              fontSize: 12,
            ),
          ],
        ),
        side: BorderSide(color: Color(0xFFC7C7CC), style: BorderStyle.solid),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Divider(thickness: 1, height: 1, color: Color(0xFFF2F2F2)),
      ),
    ],
  );
}

Widget inviteAndCheckAvailabilityNavBar(BuildContext context) {
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
        CmButton(
          backgroundColor: primaryColor,
          padding: 0,
          marginBottom: 0,
          marginTop: 0,
          height: 48,
          width: widthAccordingRation(context, 164),
          child: CmText(
            text: "Invite",
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        CmButton(
          onPressed: () {
            showAlertCheckAvailableDate(
                buttonWidth: width(context, value: 0.3));
          },
          backgroundColor: Colors.white,
          padding: 0,
          marginBottom: 0,
          marginTop: 0,
          height: 48,
          width: widthAccordingRation(context, 164),
          borderColor: primaryColor,
          child: CmText(
            text: "Check \n Availability",
            color: primaryColor,
            fontSize: 18,
            align: TextAlign.center,
          ),
        )
      ],
    ),
  );
}