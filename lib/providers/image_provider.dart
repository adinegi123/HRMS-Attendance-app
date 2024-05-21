import 'dart:developer';
import 'dart:io' as io;


import 'package:attendance_app/Firebase%20methods/firebase_methods.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class ImagePickerProvider extends ChangeNotifier {
  String? mediaDownloadLink;
  bool isNewImgCropped = false;
  io.File? profileImageFile;
  // String? profileImageLink;
  List<String> attachedImages = [];

  void updateImageFile(io.File imageFile) {
    profileImageFile = imageFile;
    notifyListeners();
  }

  void addImageToAttachedImages({required String image}) {
    attachedImages.add(image);
    updateIsNewImgCroppedStatus(isNewImgCroppedStatus: false);
    notifyListeners();
  }

  void removeAtIndex({required int index}) {
    attachedImages.removeAt(index);
    notifyListeners();
  }

  void updateIsNewImgCroppedStatus({required bool isNewImgCroppedStatus,bool isUpdate=false}) {
    isNewImgCropped = isNewImgCroppedStatus;

    notifyListeners();
  }

  void updateMediaUrl(String downloadUrl) {
    mediaDownloadLink = downloadUrl;
    notifyListeners();
  }

  Future<void> uploadPicture(CroppedFile croppedImage) async {
    try {
      updateIsNewImgCroppedStatus(isNewImgCroppedStatus: true);
      updateImageFile(io.File(croppedImage.path));
      String imageUrl =
          await FirebaseMethods.uploadImage(io.File(croppedImage.path));
      log('Image uploaded to Firebase Storage. URL: $imageUrl');
      updateMediaUrl(imageUrl);
      updateIsNewImgCroppedStatus(isNewImgCroppedStatus: false);
    } catch (e) {
      log('Error uploading image to Firebase Storage: $e');
    }
  }

  void resetValue() {
    profileImageFile = null;
    mediaDownloadLink = null;
  }
}
