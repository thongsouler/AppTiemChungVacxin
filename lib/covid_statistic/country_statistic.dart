// import 'package:flutter/material.dart';
// import 'package:timeago/timeago.dart' as timeago;
//
//
//
// import 'country_summary.dart';
//
// class CountryStatistics extends StatelessWidget {
//
//   final List<CountrySummaryModel> summaryList;
//
//   CountryStatistics({this.summaryList});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//
//         buildCard(
//           "CONFIRMED",
//           summaryList[summaryList.length - 1].confirmed,
//           Colors.green,
//           "ACTIVE",
//           summaryList[summaryList.length - 1].active,
//           Colors.green,
//         ),
//
//         buildCard(
//           "RECOVERED",
//           summaryList[summaryList.length - 1].recovered,
//           Colors.green,
//           "DEATH",
//           summaryList[summaryList.length - 1].death,
//           Colors.green,
//         ),
//
//
//       ],
//     );
//   }
//
//   Widget buildCard(String leftTitle, int leftValue, Color leftColor,
//       String rightTitle, int rightValue, Color rightColor) {
//     return Card(
//       elevation: 1,
//       child: Container(
//         height: 100,
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//
//                 Text(
//                   leftTitle,
//                   style: TextStyle(
//                     color: Colors.grey,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                   ),
//                 ),
//
//                 Expanded(
//                   child: Container(),
//                 ),
//
//                 Text(
//                   "Total",
//                   style: TextStyle(
//                     color: leftColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 12,
//                   ),
//                 ),
//
//                 Text(
//                   leftValue.toString(),
//                   style: TextStyle(
//                     color: leftColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 28,
//                   ),
//                 ),
//               ],
//             ),
//
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: <Widget>[
//
//                 Text(
//                   rightTitle,
//                   style: TextStyle(
//                     color: Colors.grey,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                   ),
//                 ),
//
//                 Expanded(
//                   child: Container(),
//                 ),
//
//                 Text(
//                   "Total",
//                   style: TextStyle(
//                     color: rightColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 12,
//                   ),
//                 ),
//
//                 Text(
//                   rightValue.toString(),
//                   style: TextStyle(
//                     color: rightColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 28,
//                   ),
//                 ),
//               ],
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
