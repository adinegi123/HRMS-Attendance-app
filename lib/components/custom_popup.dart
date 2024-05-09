import 'package:attendance_app/components/progress_indicator.dart';
import 'package:attendance_app/shared/date_picker.dart';

import 'package:attendance_app/shared/image_picker.dart';
import 'package:attendance_app/shared/internet_check_popup.dart';
import 'package:attendance_app/shared/location_service_popup.dart';
import 'package:attendance_app/shared/logout_popup.dart';
import 'package:attendance_app/shared/month_year_popup.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPopup {
  static showImagePickerPopup({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) => ImagePick(),
    );
  }

  static late BuildContext _dialogContext;

  /* static showExitPopup({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) => ExitPopup(),
    );
  }*/

  static showLogoutPopup({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) => const LogoutPopup(),
    );
  }

  static showMonthYearPicker({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) => const MonthYearPickerPopup(),
    );
  }

  // static showLogoutPopup({required BuildContext context, String? text}) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) => const LogoutPopup(),
  //   );
  // }

  static showProgressIndicator({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        _dialogContext = context;
        return const ProgressIndicatorPopup();
      },
    );
  }

  static dismissProgressIndicator() {
    Navigator.of(_dialogContext).pop();
  }

  static showInternetCheckPopup(
          {required BuildContext context,
          required GlobalKey<State<StatefulWidget>> dialogKey}) =>
      showDialog(
        context: context,
        builder: (context) => InternetCheckPopup(
          dialogKey: dialogKey,
        ),
      );

  static showLocationCheckPopup({required BuildContext context}) => showDialog(
        context: context,
        builder: (context) => const LocationServicePopup(),
      );

  static showDatePicker(
      {required BuildContext context, required TextEditingController DOB}) {
    return showDialog(
      context: context,
      builder: (context) => DatePicker(
        dobController: DOB,
      ),
    );
  }
}
