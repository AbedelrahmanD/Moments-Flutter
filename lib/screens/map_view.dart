import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moment/helpers/widgets/cm_button.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_positioned.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/screens/search_location.dart';
import 'package:moment/utils/constants.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'package:moment/widgets/mm_text_field.dart';

class MapView extends StatefulWidget {
  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  TextEditingController searchLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MMScaffold(
      backgroundColor: Colors.white,
      appBarSize: 50,
      bodyPadding: EdgeInsets.all(0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        //   appBarExtends: Center(
        //     child: CmContainer(
        //       width: width(context, value: 0.85),
        //       child: CmText(
        //         text: "Select Location",
        //         fontSize: 28,
        //       ),
        //     ),
        //   ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          CmPositioned(
            top: 0,
            start: 0,
            end: 0,
            child: CmContainer(
              borderRadiusBottomStart: 16,
              borderRadiusBottomEnd: 16,
              height: 50,
              color: Colors.white,
              paddingStart: 20,
              child: CmText(
                text: "Select Location",
                fontSize: 28,
              ),
            ),
          ),
          CmPositioned(
            top: 70,
            start: 20,
            end: 20,
            child: CmContainer(
              color: Colors.white,
              borderRadiusAll: 16,
              borderWidthAll: 1,
              borderColor: Color(0xffDFD8D0),
              child: MMTextField(
                text: "Search for location",
                controller: searchLocationController,
                width: width(context),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }
  Widget buildMyNavBar(BuildContext context) {
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
            padding: 0,
            marginBottom: 0,
            marginTop: 0,
            height: 48,
            width: widthAccordingRation(context, 342),
            onPressed: (){
              Get.to(()=> SearchLocation());
            },
            child: CmText(
              text: "Add Location",
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
