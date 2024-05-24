import 'package:attendance_app/screens/apply_for_leave/apply_leave.dart';
import 'package:attendance_app/screens/daily_report/daily_report.dart';
import 'package:attendance_app/screens/dashboard/widget/attendance_calender.dart';
import 'package:attendance_app/screens/leave_approval/leave_approval.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../components/custom_grid_view.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  /*List imageList = [
    {"id": 1, "image_path": 'assets/images/carousel_img.jpg'},
    {"id": 2, "image_path": 'assets/images/carousel_img.jpg'},
    {"id": 3, "image_path": 'assets/images/carousel_img.jpg'}
  ];*/

  // @override
  // Widget build(BuildContext context) {
  //   return Column(children: [
  //     const SizedBox(
  //       height: 100,
  //     ),
  //     Container(
  //       child: CarouselSlider(
  //         items: [1, 2, 3].map((i) {
  //           return Container(
  //             width: MediaQuery
  //                 .of(context)
  //                 .size
  //                 .width,
  //             margin: const EdgeInsets.symmetric(horizontal: 5),
  //             decoration: BoxDecoration(
  //               color: Colors.amber,
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //             child: Center(
  //               child: Text(
  //                 "Text $i",
  //                 style: const TextStyle(fontSize: 40),
  //               ),
  //             ),
  //           );
  //         }).toList(),
  //         options: CarouselOptions(
  //             autoPlay: true,
  //             height: 100,
  //             aspectRatio: 1 / 4,
  //             clipBehavior: Clip.hardEdge),
  //       ),
  //     )
  //   ]);
  // }
  final leaveScreen = LeaveApproval();
  final applyLeaveScreen = ApplyLeave();
  final dailyReportScreen = DailyReport();

  @override
  Widget build(BuildContext context) {
    return CustomGridView(
      itemNames: ['Leave', 'Apply Leave', 'Daily Report'],
      targetScreens: [leaveScreen, applyLeaveScreen, dailyReportScreen],
      iconPaths: [
        'assets/icons/leave.png',
        'assets/icons/applyleave.png',
        'assets/icons/daily_report.png',
      ],
    );


    /* Column(
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text("Leave Approval"),
        ),
      ],
    );*/

  }
}

