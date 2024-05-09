import 'package:flutter/foundation.dart';

class Utils {
  static bool isEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static bool isPhoneNumber(String input) {
    // Regular expression to validate phone numbers
    final phoneRegex = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
    return phoneRegex.hasMatch(input);
  }

  static List<DateTime> generateCalendarGrid(
      int currentMonth, int currentYear) {
    List<DateTime> gridDates = [];
    DateTime firstDayOfCurrentMonth = DateTime(currentYear, currentMonth, 1);
    int totalDaysToDisplay = 6 * 7;

    if (firstDayOfCurrentMonth.weekday == DateTime.monday) {
      for (int i = 0; i < totalDaysToDisplay; i++) {
        DateTime day = firstDayOfCurrentMonth.add(Duration(days: i));
        gridDates.add(day);
      }
    } else {
      int differenceFromMonday = firstDayOfCurrentMonth.weekday - 1;
      for (int i = 0; i < differenceFromMonday; i++) {
        DateTime day = firstDayOfCurrentMonth.subtract(Duration(days: i + 1));
        gridDates.add(day);
      }
      for (int i = 0; i < (totalDaysToDisplay - differenceFromMonday); i++) {
        DateTime day = firstDayOfCurrentMonth.add(Duration(days: i));
        gridDates.add(day);
      }
    }
    gridDates.sort((a, b) => a.compareTo(b));
    gridDates.removeDuplicates();
    return gridDates;
  }

  static List<int> getYears() {
    final DateTime now = DateTime.now();
    List<int> returnList = [];
    for (int i = 0; i < 70; i++) {
      returnList.add(now.subtract(Duration(days: i * 365)).year);
    }
    print(returnList);
    return returnList;
  }

  static List<int> getPastFourYears() {
    final DateTime now = DateTime.now();
    List<int> returnList = [];
    for (int i = 0; i < 4; i++) {
      returnList.add(now.subtract(Duration(days: i * 365)).year);
    }
    if (kDebugMode) {
      print(returnList);
    }
    return returnList;
  }

  static String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return 'Invalid month';
    }
  }
}

extension RemoveDuplicates<E> on List<E> {
  List<E> removeDuplicates() {
    Set<E> uniqueItems = <E>{};
    List<E> result = [];

    for (var item in this) {
      if (!uniqueItems.contains(item)) {
        result.add(item);
        uniqueItems.add(item);
      }
    }

    return uniqueItems.toList();
  }
}
