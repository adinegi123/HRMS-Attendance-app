import 'package:flutter/material.dart';

import '../class/utils.dart';

class DateProvider with ChangeNotifier {
  DateTime selectedDate = DateTime.now();
  List<DateTime> get calenderDates =>
      Utils.generateCalendarGrid(selectedDate.month, selectedDate.year);

  void updateSelectedDate({required DateTime date}) {
    selectedDate = date;
    notifyListeners();
  }
}
