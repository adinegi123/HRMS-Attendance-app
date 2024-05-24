import 'package:attendance_app/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:attendance_app/providers/date_Provider.dart';
import 'package:intl/intl.dart';

import '../class/utils.dart';
import '../components/custom dropdown.dart';

class DatePicker extends StatelessWidget {
  final TextEditingController dobController;
  const DatePicker({super.key, required this.dobController});
  static List<int> months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer<DateProvider>(
            builder: (context, value, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Date'),
                          CustomDropDownMenu(
                            initialSelection: value.selectedDate.day,
                            onSelect: (e) {
                              var date = value.selectedDate;
                              value.updateSelectedDate(
                                date: DateTime(date.year, date.month, e as int),
                              );
                            },
                            contentPadding: const EdgeInsets.only(left: 10),
                            dropdownMenuEntries: _generateDaysDropdown(value.selectedDate),
                            width: MediaQuery.of(context).size.width / 4 - 10,
                          ),
                        ],
                      ),
                      const SizedBox(width: 5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Month'),
                          CustomDropDownMenu(
                            initialSelection: DateTime.now().month,
                            onSelect: (e) {
                              var date = value.selectedDate;
                              value.updateSelectedDate(
                                  date: DateTime(date.year, e as int));
                            },
                            contentPadding: const EdgeInsets.only(left: 10),
                            dropdownMenuEntries: months
                                .map((e) => DropdownMenuEntry(
                                value: e, label: Utils.getMonthName(e)))
                                .toList(),
                            width: MediaQuery.of(context).size.width / 4,
                          ),
                        ],
                      ),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Year'),
                          CustomDropDownMenu(
                            initialSelection: DateTime.now().year,
                            onSelect: (e) {
                              var date = value.selectedDate;
                              value.updateSelectedDate(
                                  date: DateTime(e as int, date.month));
                            },
                            contentPadding: const EdgeInsets.only(left: 10),
                            dropdownMenuEntries: Utils.getYears()
                                .map((e) => DropdownMenuEntry(
                                value: e, label: e.toString()))
                                .toList(),
                            width: MediaQuery.of(context).size.width / 4
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Buttons(
                     onTap: () {
                       final selectedDate = value.selectedDate;
                       dobController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
                       Navigator.pop(context);
                     },
                     buttonText: const Center(
                       child: Center(
                         child: Text(
                           'Submit',
                           style: TextStyle(color: Colors.white),
                         ),
                       ),
                     ),
                   ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
  List<DropdownMenuEntry<int>> _generateDaysDropdown(DateTime selectedDate) {
    final List<int> daysInMonth = _daysInMonth(selectedDate.year, selectedDate.month);
    return daysInMonth.map((day) => DropdownMenuEntry(value: day, label: day.toString())).toList();
  }

  List<int> _daysInMonth(int year, int month) {
    final List<int> daysInMonth = List.generate(
      DateTime(year, month + 1, 0).day,
          (index) => index + 1,
    );
    return daysInMonth;
  }
}
