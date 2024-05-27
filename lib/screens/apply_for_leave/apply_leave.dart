import 'package:attendance_app/components/buttons.dart';
import 'package:attendance_app/components/custom_text_widget.dart';
import 'package:attendance_app/components/my_textfields.dart';
import 'package:attendance_app/components/secondary_appbar.dart';
import 'package:attendance_app/components/text_widget.dart';
import 'package:flutter/material.dart';
import '../../components/custom dropdown.dart';

class ApplyLeave extends StatefulWidget {
  const ApplyLeave({super.key});

  @override
  State<ApplyLeave> createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  final List<String> leaveType = [
    'Casual',
    'Sick Leave',
    'Other'
  ];

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController totalDaysController = TextEditingController();
  TextEditingController reason = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBar(screenName: "Apply for Leave"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*MyTextWidget(text: "Leave application", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),*/
            SizedBox(height: 15,),
            TextWidget(text: "Please provide Application about your Leave.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),

            const MyTextWidget(text: "Reason For Leave"),
            Center(
              child: CustomDropDownMenu(
                width:MediaQuery.of(context).size.width-40,
                color: Colors.white,
                leadingIcon: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: SizedBox(
                      height: 26,
                      width: 28,
                      child: Icon(Icons.leave_bags_at_home),
                    )),
                dropdownMenuEntries: leaveType
                    .map((e) => DropdownMenuEntry(value: e, label: e))
                    .toList(),
                initialSelection: 'Select reason',
                hintText: 'Type of leave',
                contentPadding: const EdgeInsets.only(left: 10),
              ),
            ),
            const MyTextWidget(text: "Start Date"),
            MyTextField(hintText: "Select Start Date",
              controller: startDateController,
              suffixIcon: const Icon(Icons.calendar_month),
            ),
            const MyTextWidget(text: "End Date",),
            MyTextField(hintText: "Select End Date",
              controller: endDateController,
              suffixIcon: const Icon(Icons.calendar_month),
            ),
            const MyTextWidget(text: "Number Of Days"),
            MyTextField(hintText: "No. Of Days",
              controller: totalDaysController
            ),
            const MyTextWidget(text: "Purpose for leave"),
            MyTextField(hintText: "Reason",
              controller: reason
            ),
            const SizedBox(height: 50,),
            Center(child: Buttons(onTap: (){},
                buttonText: const Center(
                    child: Text("Apply Leave", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),)
                ))),
          ],
        ),
      ),
    );
  }
}
