import 'package:attendance_app/components/custom_text_widget.dart';
import 'package:attendance_app/components/secondary_appbar.dart';
import 'package:flutter/material.dart';
import '../../components/custom dropdown.dart';

class ApplyLeave extends StatefulWidget {
  const ApplyLeave({super.key});

  @override
  State<ApplyLeave> createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  final List<String> leaveType = [
    'Select reason'
    'Casual',
    'Sick Leave',
    'Other'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBar(screenName: "Apply for Leave"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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


        ],
      ),
    );
  }
}
