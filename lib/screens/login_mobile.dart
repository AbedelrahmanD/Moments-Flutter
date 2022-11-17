
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/screens/login_code.dart';
import 'package:moment/utils/constants.dart';
import 'package:moment/widgets/alert_box.dart';
import 'package:moment/widgets/mm_button.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:moment/widgets/mm_text_field.dart';
import 'package:get/get.dart';
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

        priorityList: [
          CountryPickerUtils.getCountryByIsoCode('SA'),
          CountryPickerUtils.getCountryByIsoCode('LB'),
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: primaryColor,
          ),
        ),
        backgroundColor: Colors.white,
        appBarSize: 50,
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
                      onChanged: (value){
                        setState(() {
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: heightAccordingRation(context,80),
                ),
                MMButton(
                  color: mobileController.text.isEmpty?const Color(0xFFF2F2F2):primaryColor,
                  textColor: mobileController.text.isEmpty?const Color(0x3C3C434D):Colors.white,
                  width: width(context),
                  onPressed: () {
                    if(mobileController.text.isEmpty){
                      showAlert(title: "Please Add Your Phone Number!");
                    }
                    else {
                      Get.to(() => const LoginCode());
                    }
                  },
                  text: "Next",
                )
              ],
            ),
          ),
        ));
  }
}


