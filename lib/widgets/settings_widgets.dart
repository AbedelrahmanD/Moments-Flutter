import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_button.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';

Widget settingsProfileInformationBox({
  required double width,
  required String image,
  required String name,
  required String countryCode,
  required String phoneNumber,
}) {
  return CmContainer(
      width: width,
      borderRadiusAll: 16,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 32,
          ),
          CmContainer(width: 104, height: 104, child: Image.asset(image)),
          SizedBox(
            height: 8,
          ),
          CmText(
            text: name,
            fontSize: 28,
            align: TextAlign.center,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CountryPickerUtils.getDefaultFlagImage(
                  CountryPickerUtils.getCountryByPhoneCode(countryCode)),
              SizedBox(
                width: 6,
              ),
              CmText(
                text: phoneNumber,
                fontSize: 18,
                align: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ));
}

Widget networkListItem({
  required String name,
  required int selectedNetworkOptionId,
  required double buttonWidth,
  required double buttonHeight,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CmContainer(
          paddingTop: 14,
          paddingStart: 16,
          paddingEnd: 16,
          paddingBottom: 14,
          borderColor: const Color(0xffDFD8D0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CmContainer(
                        width: 32,
                        height: 32,
                        child: Image.asset("assets/images/profile.png")),
                    SizedBox(
                      width: 8,
                    ),
                    CmText(
                      text: name,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              CmButton(
                  marginBottom: 0,
                  marginTop: 0,
                  width: buttonWidth,
                  height: buttonHeight,
                  backgroundColor: Colors.white,
                  borderColor: primaryColor,
                  borderWidth: 1,
                  padding: 0,
                  borderRadius: 100,
                  child: CmText(
                    text: selectedNetworkOptionId == 2 ? "Unfollow" : "Remove",
                    fontSize: 14,
                    color: primaryColor,
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(thickness: 1, height: 1, color: Color(0xFFF2F2F2)),
        ),
      ],
    ),
  );
}
