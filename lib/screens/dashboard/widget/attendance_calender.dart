import 'package:attendance_app/class/constant.dart';
import 'package:attendance_app/class/utils.dart';
import 'package:attendance_app/components/custom_popup.dart';
import 'package:attendance_app/screens/dashboard/provider/calender_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AttendanceCalender extends StatelessWidget {
  const AttendanceCalender({super.key});

  static List<String> weekDays = [
    'M',
    ' T ',
    'W',
    'TH',
    ' F',
    ' S',
    'S',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<CalenderProvider>(builder: (context, value, child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: ColorConst.appPurpleColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          '${Utils.getMonthName(value.selectedDate.month)}, ${value.selectedDate.year}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () =>
                              CustomPopup.showMonthYearPicker(context: context),
                          child: const Icon(
                            Icons.calendar_month,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: weekDays
                        .map(
                          (e) => CircleAvatar(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, top: 5, bottom: 5),
                              child: Text(
                                e,
                                style: const TextStyle(
                                  color: Color(0xff243E84),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                GridView.builder(
                  itemCount: value.calenderDates.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7),
                  itemBuilder: (context, index) {
                    return Container(
                      color: ColorConst.appPurpleColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            value.calenderDates[index].day.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: (value.calenderDates[index].month !=
                                      value.selectedDate.month)
                                  ? Colors.grey
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          );
        }),
      ],
    );
  }
}
