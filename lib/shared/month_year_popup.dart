import 'package:attendance_app/class/utils.dart';
import 'package:attendance_app/components/buttons.dart';
import 'package:attendance_app/components/custom%20dropdown.dart';
import 'package:attendance_app/screens/dashboard/provider/calender_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MonthYearPickerPopup extends StatefulWidget {
  const MonthYearPickerPopup({super.key});

  static List<int> months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  @override
  State<MonthYearPickerPopup> createState() => _MonthYearPickerPopupState();
}

class _MonthYearPickerPopupState extends State<MonthYearPickerPopup> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<CalenderProvider>(
            builder: (context, value, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Month'),
                          CustomDropDownMenu(
                            initialSelection: value.selectedDate.month,
                            onSelect: (e) {
                              var setSelectedDate =
                                  DateTime(selectedDate.year, e as int);
                              setState(() {
                                selectedDate = setSelectedDate;
                              });
                              // value.updateSelectedDate(
                              //     date: DateTime(date.year, e as int));
                            },
                            contentPadding: const EdgeInsets.only(left: 10),
                            dropdownMenuEntries: MonthYearPickerPopup.months
                                .map((e) => DropdownMenuEntry(
                                    value: e, label: Utils.getMonthName(e)))
                                .toList(),
                            width: MediaQuery.of(context).size.width / 2 - 60,
                          ),
                        ],
                      ),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Year'),
                          CustomDropDownMenu(
                            initialSelection: value.selectedDate.year,
                            onSelect: (e) {
                              var setSelectedDate =
                                  DateTime(e as int, selectedDate.month);
                              setState(() {
                                selectedDate = setSelectedDate;
                              });
                              // var date = value.selectedDate;
                              // value.updateSelectedDate(
                              //     date: DateTime(e as int, date.month));
                            },
                            contentPadding: const EdgeInsets.only(left: 10),
                            dropdownMenuEntries: Utils.getPastFourYears()
                                .map((e) => DropdownMenuEntry(
                                    value: e, label: e.toString()))
                                .toList(),
                            width: MediaQuery.of(context).size.width / 2 - 60,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Buttons(
                    onTap: () {
                      Provider.of<CalenderProvider>(context, listen: false)
                          .updateSelectedDate(date: selectedDate);
                      Navigator.pop(context);
                    },
                    buttonText: const Text('Submit'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
