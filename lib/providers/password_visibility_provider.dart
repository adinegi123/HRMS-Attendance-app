import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class PasswordVisibilityProvider with ChangeNotifier {
  bool passwordVisibility = false;
  bool confirmPasswordVisibility = false;
  String userImageURL = '';

  CroppedFile? userImage;

  togglePasswordVisibility({required bool passwordVisible, bool?confirmPasswordVisible,}) {
    passwordVisibility = passwordVisible;
    confirmPasswordVisibility = confirmPasswordVisible!;
    notifyListeners();
  }

}

