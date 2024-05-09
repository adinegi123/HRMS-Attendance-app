import 'package:attendance_app/screens/dashboard/widget/attendance_calender.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Your Attendance Calender',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: AttendanceCalender(),
          ),
        ],
      ),
    );
  }
}
