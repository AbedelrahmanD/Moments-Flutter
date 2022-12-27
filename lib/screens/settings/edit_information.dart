import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_button.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/utils/functions.dart';
import 'package:moment/widgets/input_phone_number.dart';
import 'package:moment/widgets/mm_app_bar.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:moment/widgets/mm_text_field.dart';
import 'package:moment/widgets/moments_widgets.dart';

class EditInformation extends StatefulWidget {
  const EditInformation({Key? key}) : super(key: key);

  @override
  EditInformationState createState() => EditInformationState();
}

class EditInformationState extends State<EditInformation> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('966');


  @override
  Widget build(BuildContext context) {
    return MMScaffold(
      appBarSize: 150,
      appBar: MMAppBar(
        title: "Edit Information",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MMTextField(
              inputColor: Colors.white,
              controller: nameController,
              width: widthAccordingRation(context, 341),
              text: "Name",
              onChanged: (value) {
                setState(() {});
              },
            ),
            SizedBox(
              height: 16,
            ),
            InputPhoneNumber(
                context: context,
                onValuePicked: (Country country) =>
                    setState(() {_selectedDialogCountry = country;}),
                onChanged: (value){
                  setState(() {});
                },
                selectedDialogCountry:  _selectedDialogCountry,
                countryCodeWidth: widthAccordingRation(context,114),
                phoneNumberWidth: widthAccordingRation(context,219),
                mobileController: mobileController),
            SizedBox(
              height: 16,
            ),
            MMTextField(
              readOnly: true,
              inputColor: Colors.white,
              controller: dateController,
              width: widthAccordingRation(context, 341),
              text: "Date of birth (Optional)",
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(
                        2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: primaryColor, // header background color
                            onPrimary: Colors.white, // header text color
                            onSurface: Colors.black, // body text color
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              primary: Colors.black, // button text color
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    });

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  setState(() {
                    dateController.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {
                  print("Date is not selected");
                }
              },
              onChanged: (value) {
                setState(() {});
              },
            ),
            SizedBox(
              height: 6,
            ),
            CmText(
              text: "Moments will celebrate your birthday",
              color: Color(0xFF211522).withOpacity(0.5),
              fontSize: 14,
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomButton(
          context: context,
          onPress: onModify,
          text: "Modify",
      ),
    );
  }

  void onModify () {
      showModalBottomSheet(
        backgroundColor: Colors.white,
        isDismissible: false,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        // constraints: BoxConstraints(
        //   maxWidth: MediaQuery.of(context).size.width - 32, // here increase or decrease in width
        // ),
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setModalState /*You can rename this!*/) {
                  return CmContainer(
                    width: width(context),
                    marginEnd: 16,
                    marginStart: 16,
                    marginBottom: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FractionallySizedBox(
                          widthFactor: 0.2, // width of top divider bar
                          child: Container(
                            margin: const EdgeInsets
                                .symmetric( // margin of top divider bar
                              vertical: 12.0,
                            ),
                            child: Container(
                              height: 5.0,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                // color of top divider bar
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(2.5)),
                              ),
                            ),
                          ),
                        ),
                        InputPhoneNumber(
                            context: context,
                            onValuePicked: (Country country) {
                              setState(() {
                                _selectedDialogCountry = country;
                              });
                              setModalState(() {
                                _selectedDialogCountry = country;
                              });
                            },
                            onChanged: (value) {
                              setState(() {});
                            },
                            selectedDialogCountry: _selectedDialogCountry,
                            countryCodeWidth: widthAccordingRation(
                                context, 114),
                            phoneNumberWidth: widthAccordingRation(
                                context, 184),
                            mobileController: mobileController),
                        SizedBox(height: 16,),
                        MMTextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {

                            });
                          },
                          controller: codeController,
                          width: width(context),
                          text: "Verification Code",
                          inputColor: Colors.white,
                        ),
                        SizedBox(height: 16,),
                        CmButton(
                          backgroundColor: primaryColor,
                          child: CmText(
                            text: "Change mobile number",
                            color: Colors.white,
                          ),
                          height: 32,
                          width: width(context),
                          marginBottom: 0,
                          marginTop: 0,
                          padding: 0,
                        ),
                      ],
                    ),
                  );
                }
            ),
          );
        },
      );
    }
}
