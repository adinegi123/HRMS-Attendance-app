import 'package:attendance_app/class/utils.dart';
import 'package:flutter/cupertino.dart';

class CalenderProvider extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();

  List<DateTime> get calenderDates =>
      Utils.generateCalendarGrid(selectedDate.month, selectedDate.year);

  void updateSelectedDate({required DateTime date}) {
    selectedDate = date;
    notifyListeners();
  }

  ///Updates provider logically
  void notifyProvider() => notifyListeners();
}
