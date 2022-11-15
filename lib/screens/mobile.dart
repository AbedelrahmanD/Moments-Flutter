

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/utils/constants.dart';

class Mobile extends StatefulWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  _MobileState createState() => _MobileState();
}

class _MobileState extends State<Mobile> {

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
    return

             Scaffold(
              body: Container(
                width: Get.width,
                height: Get.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/logo.png"),
                    SizedBox(
                      height:12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: Get.width * 0.3,
                          // width: widthAccordingRation(114),
                          height: 48,
                          // isClipHardEdge: true,
                          // borderRadiusAll: 16,
                          // borderWidthAll: 1,
                          // borderColor: const Color(0xFFF2F2F2),
                          child: InkWell(
                            onTap: _openCountryPickerDialog,
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: _buildDialogItem(_selectedDialogCountry),
                            ),
                          ),
                        ),

                      ],
                    ),
                    Container(

                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),

                        width: width(context),
                        child: ElevatedButton(onPressed: (){}, child: Text("hello")))
                  ],
                ),
              ),
            );

  }
}
