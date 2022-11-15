
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/screens/login_code.dart';
import 'package:moment/utils/constants.dart';
import 'package:moment/widgets/mm_button.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:moment/widgets/mm_text_field.dart';
import 'package:get/get.dart';
import 'package:moment/screens/home.dart';
import 'package:moment/widgets/mm_logo.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({Key? key}) : super(key: key);

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {

  TextEditingController mobileController = TextEditingController();

  Country _selectedDialogCountry =
  CountryPickerUtils.getCountryByPhoneCode('961');


  void _openCountryPickerDialog() => showDialog(
    context: context,
    builder: (context) => Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.pink),
      child: CountryPickerDialog(
        titlePadding: const EdgeInsets.all(8.0),
        searchCursorColor: primaryColor,
        searchInputDecoration: const InputDecoration(hintText: 'Search...'),
        isSearchable: true,
        title: const Text('Select your phone code'),
        onValuePicked: (Country country) =>
            setState(() => _selectedDialogCountry = country),
        itemBuilder: _buildDialogItem,
        itemFilter: (c) => ['AR', 'DE', 'GB', 'CN'].contains(c.isoCode),

        priorityList: [
          CountryPickerUtils.getCountryByIsoCode('LB'),
          CountryPickerUtils.getCountryByIsoCode('US'),
        ],
      ),
    ),
  );


  Widget _buildDialogItem(Country country) =>
      Row(
    children: <Widget>[
      CountryPickerUtils.getDefaultFlagImage(country),
      const SizedBox(width: 8.0),
      Text("+${country.phoneCode}"),
      const SizedBox(width: 8.0),
      Flexible(child: Text(country.name))
    ],
  );


  @override
  Widget build(BuildContext context) {
    return MMScaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const MMLogo(),
                 SizedBox(
                  height: heightAccordingRation(context,48),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CmContainer(
                      width: widthAccordingRation(context,114),
                      // width: widthAccordingRation(114),
                      height: 48,
                      isClipHardEdge: true,
                      borderRadiusAll: 16,
                      borderWidthAll: 1,
                      borderColor: const Color(0xFFF2F2F2),
                      child: InkWell(
                        onTap: _openCountryPickerDialog,
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: _buildDialogItem(_selectedDialogCountry),
                        ),
                      ),
                    ),
                    MMTextField(
                      controller: mobileController,
                      width: widthAccordingRation(context,219),
                      text: "Mobile Number",
                    ),
                  ],
                ),
                SizedBox(
                  height: heightAccordingRation(context,80),
                ),
                MMButton(
                  color: primaryColor,
                  width: width(context),
                  onPressed: () {
                    Get.to(() => const LoginCode());
                  },
                  text: "Next",
                )
              ],
            ),
          ),
        ));
  }
}

