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
