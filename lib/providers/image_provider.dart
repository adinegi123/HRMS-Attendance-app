import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class ImagePickerProvider extends ChangeNotifier {
  String userImageURL = '';

  ///Delete this is production
  CroppedFile? userImage;

  updateUserImageURL(String url) {
    userImageURL = url;
    if (url.isEmpty) userImage = null;
    notifyListeners();
  }

  updateUserImageFile({required CroppedFile file}) {
    userImage = file;
    notifyListeners();
  }
}
