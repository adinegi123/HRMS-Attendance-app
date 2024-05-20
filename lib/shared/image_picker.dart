
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../components/buttons.dart';
import '../providers/image_provider.dart';

class ImagePick extends StatelessWidget {
  ImagePick({super.key, this.text});

  final String? text;
  final ImagePicker _imagePicker = ImagePicker();
  final ImageCropper _imageCropper = ImageCropper();

  Future<CroppedFile?> uploadImage(
      {required ImageSource source, required BuildContext context}) async {
    var resImage = await _imagePicker.pickImage(source: source);
    if (resImage != null) {
      var croppedImage = await _imageCropper.cropImage(
        sourcePath: resImage.path,
        compressQuality: 70,
      );
      if (croppedImage != null && context.mounted) {
        String imagePath = croppedImage.path;
        Provider.of<ImagePickerProvider>(context, listen: false).
        uploadPicture(croppedImage);
        Navigator.pop(context);
        return croppedImage;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text ?? 'Upload Image',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Column(
                  children: [
                    Buttons(
                      onTap: () async {
                        var res = await Permission.camera.request();
                        if (res == PermissionStatus.denied ||
                            res == PermissionStatus.permanentlyDenied ||
                            res == PermissionStatus.restricted) {
                          // negative case
                        } else {
                          // positive case
                          // ignore: use_build_context_synchronously
                          var croppedImage = await uploadImage(
                              source: ImageSource.gallery, context: context);
                          if (croppedImage != null) {
                            Provider.of<ImagePickerProvider>(context, listen: false).uploadPicture(croppedImage);
                            Navigator.pop(context);
                          }
                        }
                      },
                      buttonText: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Take a picture',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.camera,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Buttons(
                      onTap: () async {
                        var res = await Permission.mediaLibrary.request();
                        if (res == PermissionStatus.denied ||
                            res == PermissionStatus.permanentlyDenied ||
                            res == PermissionStatus.restricted) {
                          // negative case
                        } else {
                          // positive case
                          // ignore: use_build_context_synchronously
                          var resImage = await uploadImage(
                              source: ImageSource.gallery, context: context);
                          if (resImage != null) {}
                        }
                      },
                      buttonText: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Upload from Gallery',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.photo_library_rounded,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

