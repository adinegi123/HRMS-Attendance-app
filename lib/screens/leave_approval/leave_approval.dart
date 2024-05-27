import 'package:attendance_app/components/custom_container.dart';
import 'package:attendance_app/components/custom_text_widget.dart';
import 'package:attendance_app/components/secondary_appbar.dart';
import 'package:flutter/material.dart';
import '../../components/text_widget.dart';

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
      appBar: const SecondaryAppBar(screenName: "Leave Approval"),
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         const SizedBox(height: 15,),
         const TextWidget(text: "Status Of Your Application",
           style: TextStyle(
               fontSize: 17,
               fontWeight: FontWeight.bold
           ),
         ),
         const MyTextWidget(text: "Recent Application :"),
         const CustomContainer(
             leaveType: "Sick Leave",
             dateRange:"24/May/2024 - 28/May/2024",
             status: "Pending",
             reason: "Reason",
             statusColor: Colors.yellow),
         const MyTextWidget(text: "Past Applications :"),
         const CustomContainer(
             leaveType: "Leave Type",
             dateRange:"Start Date - End Date",
             status: "Approved",
             reason: "Reason",
             statusColor: Colors.green),
         const SizedBox(height: 10,),
         CustomContainer(
             leaveType: "Leave Type",
             dateRange:"Start Date - End Date",
             status: "Rejected",
             reason: "Reason",
             statusColor: Colors.redAccent.shade200),
         const SizedBox(height: 10,),
         const CustomContainer(
             leaveType: "Leave Type",
             dateRange:"Start Date - End Date",
             status: "Approved",
             reason: "Reason",
             statusColor: Colors.green),
       ],
     ) ,
    );
  }
}
