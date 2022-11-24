
import 'package:flutter/material.dart';
import 'package:moment/helpers/config.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/helpers/widgets/cm_text_field.dart';
import 'package:moment/utils/constants.dart';
import 'package:moment/widgets/mm_app_bar.dart';
import 'package:moment/widgets/mm_scaffold.dart';
import 'dart:math' as Math;

class SearchLocation extends StatefulWidget {
  const SearchLocation({Key? key}) : super(key: key);

  @override
  _SearchLocationState createState() => _SearchLocationState();
}

class StarShape extends OutlinedBorder {
  final BorderSide side;

  StarShape({
    this.side = const BorderSide(),
  });

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return StarShape(side: side ?? const BorderSide());
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(10);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    var _path = Path()
      ..addRect(rect.deflate(25))
      ..close();
    return _path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = rect.inflate(15);
    var mid = rect.width / 2;
    var min = Math.min(rect.width, rect.height);
    var half = min / 2;
    mid = mid - half;
    var path = Path();
// top left
    path.moveTo(mid + half * 0.5, half * 0.84);
// top right
    path.lineTo(mid + half * 1.5, half * 0.84);
// bottom left
    path.lineTo(mid + half * 0.68, half * 1.45);
// top tip
    path.lineTo(mid + half * 1.0, half * 0.5);
// bottom right
    path.lineTo(mid + half * 1.32, half * 1.45);
// top left
    path.lineTo(mid + half * 0.5, half * 0.84);
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    rect = rect.inflate(15);
    var mid = rect.width / 2;
    var min = Math.min(rect.width, rect.height);
    var half = min / 2;
    mid = mid - half;

    var path = Path();
// top left
    path.moveTo(mid + half * 0.5, half * 0.84);
// top right
    path.lineTo(mid + half * 1.5, half * 0.84);
// bottom left
    path.lineTo(mid + half * 0.68, half * 1.45);
// top tip
    path.lineTo(mid + half * 1.0, half * 0.5);
// bottom right
    path.lineTo(mid + half * 1.32, half * 1.45);
// top left
    path.lineTo(mid + half * 0.5, half * 0.84);
        canvas.drawPath(
      path,
      Paint()..color = Colors.red,
    );
  }

  @override
  ShapeBorder scale(double t) {
    return this.scale(t);
  }
}

class _SearchLocationState extends State<SearchLocation> {
  dynamic locations =
    {
      "starred_locations": [
  {"name":"1- Al Ameen Abdullah Al Ali Al Naeem St, Al Malaz, Riyadh","isStarred":true},
  {"name":"2- Al Ameen Abdullah Al Ali Al Naeem St, Al Malaz, Riyadh","isStarred":true},
  {"name":"3- Al Ameen Abdullah Al Ali Al Naeem St, Al Malaz, Riyadh","isStarred":true},
      ],
      "recent_locations": [
        {"name": "4- Al Ameen Abdullah Al Ali Al Naeem St, Al Malaz, Riyadh","isStarred":false},
  {"name":"5- Al Ameen Abdullah Al Ali Al Naeem St, Al Malaz, Riyadh" ,"isStarred":false},
  {"name":"6- Al Ameen Abdullah Al Ali Al Naeem St, Al Malaz, Riyadh" ,"isStarred":false},
  {"name":"7- Al Ameen Abdullah Al Ali Al Naeem St, Al Malaz, Riyadh" ,"isStarred":false},
  {"name":"8- Al Ameen Abdullah Al Ali Al Naeem St, Al Malaz, Riyadh" ,"isStarred":false},
  {"name":"9- Al Ameen Abdullah Al Ali Al Naeem St, Al Malaz, Riyadh" ,"isStarred":false},
  {"name":"10- Al Ameen Abdullah Al Ali Al Naeem St, Al Malaz, Riyadh","isStarred":false},
  {"name":"11- Al Ameen Abdullah Al Ali Al Naeem St, Al Malaz, Riyadh","isStarred":false},
  {"name":"12- Al Ameen Abdullah Al Ali Al Naeem St, Al Malaz, Riyadh","isStarred":false},
  {"name":"13- Al Ameen Abdullah Al Ali Al Naeem St, Al Malaz, Riyadh","isStarred":false},
  {"name":"14- Al Ameen Abdullah Al Ali Al Naeem St, Al Malaz, Riyadh","isStarred":false},
        ],
    };


  @override
  Widget build(BuildContext context) {
    return MMScaffold(
      appBarSize: 187,
      bodyPadding: EdgeInsets.only(top: 16),
      appBar: MMAppBar(
        appBarExtends: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CmText(text: "Search for location",fontSize: 28,),
            SizedBox(height: 8,),
            CmTextField(
              width: widthAccordingRation(context, 341),
              borderColor: const Color(0xFFF2F2F2),
              hintText: "Search for location",
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            locations["starred_locations"].length<1?
                SizedBox():
            CmContainer(
              color: Colors.white,
              borderRadiusAll: 16,
              width: widthAccordingRation(context, 341),
              height: 160,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16,top: 12,bottom: 3),
                    child: CmText(text: "Starred Locations",fontSize: 18,color: Color(0xFFC4C4C6)),
                  ),
                  CmContainer(
                    height: 110,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: locations["starred_locations"].length,
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              return Column(
                                children: [
                                  ListTile(
                                    leading: CmContainer(
                                        width: widthAccordingRation(context, 32),
                                        height: heightAccordingRation(context, 32),
                                        child: Image.asset(
                                            "assets/images/pin.png")),
                                    title: CmText(
                                      text: locations["starred_locations"][i]["name"],
                                      fontSize: 16,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                                    // minLeadingWidth: 10,
                                    horizontalTitleGap: 0,
                                    trailing: IconButton(
                                      onPressed: (){
                                          setState(() {
                                            locations["starred_locations"][i]["isStarred"]=false;
                                            locations["recent_locations"].add(locations["starred_locations"][i]);
                                            locations["starred_locations"].remove(locations["starred_locations"][i]);
                                          });
                                      },
                                        icon: Icon(Icons.star,color: primaryColor,)),
                                  ),
                                  Divider( thickness: 1,height: 1,color: Color(0xFFF2F2F2)),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            CmContainer(
              color: Colors.white,
              borderRadiusAll: 16,
              width: widthAccordingRation(context, 341),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16,top: 12,bottom: 3),
                    child: CmText(text: "Recent Locations",fontSize: 18,color: Color(0xFFC4C4C6)),
                  ),
                  CmContainer(
                    height: 413,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: locations["recent_locations"].length,
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              return Column(
                                children: [
                                  ListTile(
                                    leading: CmContainer(
                                        width: widthAccordingRation(context, 32),
                                        height: heightAccordingRation(context, 32),
                                        child: Image.asset(
                                            "assets/images/pin.png")),
                                    title: CmText(
                                      text: locations["recent_locations"][i]["name"],
                                      fontSize: 16,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                                    // minLeadingWidth: 10,
                                    horizontalTitleGap: 0,
                                    trailing: IconButton(
                                        onPressed: (){
                                         setState(() {
                                           locations["recent_locations"][i]["isStarred"] = !locations["recent_locations"][i]["isStarred"];
                                         });
                                        },
                                        icon:locations["recent_locations"][i]["isStarred"]?Icon(Icons.star,color: primaryColor,):  Icon(Icons.star_border)),
                                  ),
                                  Divider( thickness: 1,height: 1,color: Color(0xFFF2F2F2)),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
