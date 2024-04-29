import 'package:attendance_app/components/progress_indicator.dart';
import 'package:flutter/material.dart';

import '../shared widgets/image_picker.dart';

class CustomPopup {
  static showImagePickerPopup({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) => ImagePick(),
    );
  }

  static late BuildContext _dialogContext;

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
}
