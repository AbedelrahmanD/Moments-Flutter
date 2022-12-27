import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/screens/settings/profile.dart';
import 'package:moment/utils/functions.dart';
import 'package:moment/widgets/input_phone_number.dart';
import 'package:moment/widgets/mm_app_bar.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:moment/widgets/moments_widgets.dart';

class SearchUsers extends StatefulWidget {
  const SearchUsers({Key? key}) : super(key: key);

  @override
  SearchUsersState createState() => SearchUsersState();
}

List searchResult = [];

class SearchUsersState extends State<SearchUsers> {
  TextEditingController searchController = TextEditingController();
  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('961');

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
          appBarExtends:
          InputPhoneNumber(
              context: context,
              onValuePicked: (Country country) =>
                  setState(() {_selectedDialogCountry = country;}),
              onChanged: (value){
                setState(() {
                  searchUsers(value);
                });
              },
              selectedDialogCountry:  _selectedDialogCountry,
              countryCodeWidth: widthAccordingRation(context,114),
              phoneNumberWidth: widthAccordingRation(context,219),
              mobileController: searchController),
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
                            return searchUserWidget(
                              onTap: (){
                                Get.to(()=> Profile(
                                  isMyProfile: false,
                                  userName: identity,
                                ));
                              },
                                identity: identity,
                                image: "assets/images/${searchResult[i]["image"]}",
                            );
                          },
                        )),
                  )
                ],
              ));
  }

}
