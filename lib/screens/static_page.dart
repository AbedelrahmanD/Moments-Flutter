import 'package:flutter/material.dart';
import 'package:moment/helpers/widgets/cm_container.dart';
import 'package:moment/helpers/widgets/cm_text.dart';
import 'package:moment/widgets/mm_app_bar.dart';
import 'package:moment/widgets/mm_scaffold.dart';
class StaticPage extends StatefulWidget {
final int id;
  const StaticPage({Key? key,required this.id}) : super(key: key);

  @override
  State<StaticPage> createState() => _StaticPageState();
}

class _StaticPageState extends State<StaticPage> {

  List pages=[
    {
      "id":1,
      "title":"About",
      "description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cursus risus at ultrices mi tempus imperdiet nulla malesuada pellentesque. Gravida arcu ac tortor dignissim convallis aenean et tortor at. Massa tincidunt nunc pulvinar sapien et ligula ullamcorper. Varius morbi enim nunc faucibus a pellentesque sit. Nibh sit amet commodo nulla facilisi nullam vehicula. Lectus arcu bibendum at varius vel pharetra. Et netus et malesuada fames ac turpis egestas integer eget. Nunc mi ipsum faucibus vitae aliquet nec ullamcorper. At consectetur lorem donec massa sapien faucibus et molestie. Et egestas quis ipsum suspendisse ultrices gravida dictum. Dui nunc mattis enim ut tellus. Egestas dui id ornare arcu odio ut. Facilisis gravida neque convallis a cras semper.",
    },
    {
      "id":2,
      "title":"Terms of Services",
      "description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cursus risus at ultrices mi tempus imperdiet nulla malesuada pellentesque. Gravida arcu ac tortor dignissim convallis aenean et tortor at. Massa tincidunt nunc pulvinar sapien et ligula ullamcorper. Varius morbi enim nunc faucibus a pellentesque sit. Nibh sit amet commodo nulla facilisi nullam vehicula. Lectus arcu bibendum at varius vel pharetra. Et netus et malesuada fames ac turpis egestas integer eget. Nunc mi ipsum faucibus vitae aliquet nec ullamcorper. At consectetur lorem donec massa sapien faucibus et molestie. Et egestas quis ipsum suspendisse ultrices gravida dictum. Dui nunc mattis enim ut tellus. Egestas dui id ornare arcu odio ut. Facilisis gravida neque convallis a cras semper.",
    }
  ];
  dynamic selectedPage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedPage=pages.firstWhere((element) => element["id"]==widget.id);

  }
  @override
  Widget build(BuildContext context) {
    return MMScaffold(
      appBar: MMAppBar(
        title: selectedPage["title"],
      ),
      body: SingleChildScrollView(
        child: CmContainer(
          paddingAll: 15,
          borderRadiusAll: 16,
          color: Colors.white,
          child: CmText(
            text: selectedPage["description"],
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
