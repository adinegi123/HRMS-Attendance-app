import 'package:attendance_app/components/secondary_appbar.dart';
import 'package:flutter/material.dart';

class LeaveApproval extends StatefulWidget {
  const LeaveApproval({super.key});

  @override
  State<LeaveApproval> createState() => _LeaveApprovalState();
}

class _LeaveApprovalState extends State<LeaveApproval> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: SecondaryAppBar(screenName: "Leave Approval"),
     // body: ,
    );
  }
}
