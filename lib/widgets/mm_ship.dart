// import 'package:flutter/material.dart';
// import 'package:moment/helpers/config.dart';
// import 'package:moment/helpers/widgets/cm_container.dart';
// import 'package:moment/helpers/widgets/cm_text.dart';
// import 'package:moment/utils/constants.dart';
// class MMShip extends StatelessWidget {
//   final String text;
//   final Color? color;
//   final Color? backgroundColor;
//   final VoidCallback onTap;
//   const MMShip({Key? key,this.text="",this.color,this.backgroundColor, required this.onTap}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: CmContainer(
//         marginBottom: 24,
//         marginTop: 16,
//         child: CmContainer(
//             width: widthAccordingRation(context, 104),
//             height: 24,
//             color:backgroundColor?? primaryColor,
//             borderRadiusAll: 16,
//             marginEnd: 8,
//             child: Center(
//               child: CmText(
//                 text: text,
//                 fontSize: 14,
//                 color:color?? Colors.white,
//                 align: TextAlign.center,
//               ),
//             )),
//       ),
//     );
//   }
// }
