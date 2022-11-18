import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/utils/constants.dart';
import 'package:moment/widgets/mm_app_bar.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:moment/widgets/mm_text_field.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  SearchState createState() => SearchState();
}

List searchResult = [];

class SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();

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

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(width: 8.0),
          Text("+${country.phoneCode}"),
          const SizedBox(width: 8.0),
          Flexible(child: Text(country.name))
        ],
      );

  searchUsers(String value) {
    searchResult = [];
    if(value != "") {
      searchResult = [
        {
          "image": "profile.png",
          "name": "Ahmad Mohamed",
          "phone": "01237695455"
        },
        {"image": "profile.png", "name": "", "phone": "01234567890"},
        {"image": "profile.png", "name": "", "phone": "01237695439"},
        {"image": "profile.png", "name": "Ahmad Hosny", "phone": "01234567891"},
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return MMScaffold(
        appBarSize: 150,
        appBar: MMAppBar(
          title: "Search",
          appBarExtends: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CmContainer(
                width: widthAccordingRation(context, 114),
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
                controller: searchController,
                width: widthAccordingRation(context, 219),
                text: "Mobile Number",
                onChanged: (value) {
                  setState(() {
                    searchUsers(value);
                  });
                },
              ),
            ],
          ),
        ),
        body: searchResult.isEmpty
            ? const Center(
                child: CmText(text: "No results found", fontSize: 24),
              )
            : Column(
                children: [
                  Expanded(
                    child: CmContainer(
                        width: widthAccordingRation(context, 341),
                        height: heightAccordingRation(context, 531),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: searchResult.length,
                          itemBuilder: (context, i) {
                            String identity = searchResult[i]["name"] == ""
                                ? searchResult[i]["phone"]
                                : searchResult[i]["name"];
                            return CmContainer(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CmContainer(
                                      paddingEnd: 15,
                                      paddingStart: 15,
                                      child: Row(
                                        children: [
                                          CmContainer(

                                              width: widthAccordingRation(
                                                  context, 32),
                                              height: 32,
                                              child: Image.asset(
                                                  "assets/images/${searchResult[i]["image"]}"),),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          CmText(text: identity)
                                        ],
                                      ),
                                    ),
                                    // const SizedBox(
                                    //   height: 0,
                                    // ),
                                    const Divider(color: Color(0xFF625A63),)
                                  ],
                                ));
                          },
                        )),
                  )
                ],
              ));
  }
}
