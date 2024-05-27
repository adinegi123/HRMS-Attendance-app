import 'package:attendance_app/components/buttons.dart';
import 'package:attendance_app/components/custom_text_widget.dart';
import 'package:attendance_app/components/my_textfields.dart';
import 'package:attendance_app/components/secondary_appbar.dart';
import 'package:flutter/material.dart';

import '../../components/custom_popup.dart';

class DailyReport extends StatefulWidget {
  const DailyReport({super.key});

  @override
  State<DailyReport> createState() => _DailyReportState();
}

class _DailyReportState extends State<DailyReport> {
  final TextEditingController reportType = TextEditingController();
  final TextEditingController projectName = TextEditingController();
  final TextEditingController pointers = TextEditingController();
  final TextEditingController issues = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  void dispose() {
    reportType.dispose();
    projectName.dispose();
    pointers.dispose();
    issues.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: const SecondaryAppBar(
        screenName: "Daily report",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyTextWidget(text: "Report Type"),
            MyTextField(hintText: "Enter Report type",
              controller: reportType,
            ),
            const MyTextWidget(text: "Project Name"),
            MyTextField(hintText: "Project Name",
              controller: projectName,
            ),
            const MyTextWidget(text: "Pointers"),
            MyTextField(hintText: "Today's Pointers",
              controller: pointers,
            ),
            const MyTextWidget(text: "Issues"),
            MyTextField(hintText: "Issues that encountered",
              controller: issues,
            ),
            const MyTextWidget(text: "Date"),
            MyTextField(
              hintText: "Enter Date",
              controller: dateController,
              suffixIcon: GestureDetector(
                onTap: () => CustomPopup.showDatePicker(context: context, DOB: dateController),
                child: const Icon(Icons.calendar_month),
              ),
            ),
            const SizedBox(height: 50,),
            Center(
              child: Buttons(onTap: (){}, buttonText: const Center(
                child: Text("Submit",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
