import 'package:flutter/material.dart';

class PasswordVisibilityProvider with ChangeNotifier {
  bool passwordVisibility = false;
  bool confirmPasswordVisibility = false;

  togglePasswordVisibility({required bool passwordVisible, bool?confirmPasswordVisible,}) {
    passwordVisibility = passwordVisible;
    confirmPasswordVisibility = confirmPasswordVisible!;
    notifyListeners();
  }

}

