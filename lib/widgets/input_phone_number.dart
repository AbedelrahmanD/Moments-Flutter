import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/widgets/mm_text_field.dart';

Widget InputPhoneNumber(
    {
  required context,
    required double countryCodeWidth,
    required double phoneNumberWidth,
    required TextEditingController mobileController,
    Function(String)? onChanged,
      required void Function(Country) onValuePicked,
      required Country selectedDialogCountry,
    }) {
  void _openCountryPickerDialog() => showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: primaryColor),
          child: CountryPickerDialog(
            titlePadding: const EdgeInsets.all(8.0),
            searchCursorColor: primaryColor,
            searchInputDecoration: const InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: const Text('Select your phone code'),
            onValuePicked: onValuePicked,
            itemBuilder: _buildDialogItem,
            priorityList: [
              CountryPickerUtils.getCountryByIsoCode('SA'),
              CountryPickerUtils.getCountryByIsoCode('LB'),
            ],
          ),
        ),
      );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CmContainer(
        width: countryCodeWidth,
        // width: widthAccordingRation(114),
        color: Colors.white,
        height: 48,
        isClipHardEdge: true,
        borderRadiusAll: 16,
        borderWidthAll: 1,
        borderColor: const Color(0xFFF2F2F2),
        child: InkWell(
          onTap: _openCountryPickerDialog,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: _buildDialogItemText(selectedDialogCountry),
          ),
        ),
      ),
      MMTextField(
        inputColor: Colors.white,
        keyboardType: TextInputType.number,
        controller: mobileController,
        width: phoneNumberWidth,
        text: "Mobile Number",
        onChanged: onChanged,
      ),
    ],
  );
}

Widget _buildDialogItemText(Country country) =>
    Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        Flexible(fit: FlexFit.loose,child: const SizedBox(width: 8.0)),
        Text("+${country.phoneCode}",overflow: TextOverflow.fade),
      ],
    );

Widget _buildDialogItem(Country country) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(width: 8.0),
          Text("+${country.phoneCode}"),
          const SizedBox(width: 8.0),
          Expanded(child: Text(country.name,overflow: TextOverflow.clip,maxLines: 2,))
        ],
      ),
    );