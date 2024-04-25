import 'package:flutter/material.dart';

import '../shared widgets/image_picker.dart';

class CustomPopup{
  static showImagePickerPopup({required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (context) => ImagePick(),
  );
}
}