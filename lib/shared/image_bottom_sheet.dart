import 'package:attendance_app/services/navgator_key.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../components/custom_text_widget.dart';
import '../providers/image_provider.dart';


final ImagePicker _imagePicker = ImagePicker();
final ImageCropper _imageCropper = ImageCropper();

Future<String?> uploadImage(
    {required ImageSource source, required BuildContext context}) async {
  var resImage = await _imagePicker.pickImage(source: source);
  if (resImage != null) {
    var croppedImage = await _imageCropper.cropImage(
      sourcePath: resImage.path,
      compressQuality: 70,
    );
    if (croppedImage != null && context.mounted) {
      String imagePath = croppedImage.path;
      Provider.of<ImagePickerProvider>(context, listen: false)
          .updateUserImageFile(file: croppedImage);
      Navigator.pop(context);
      return imagePath;
    }
  }
  return null;
}

void showImagePicker(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyTextWidget(text: "Profile Photo"),
                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        var res = await Permission.camera.request();
                        if (res == PermissionStatus.granted && context.mounted) {
                          await uploadImage(
                              source: ImageSource.gallery, context: context);
                        } else {
                          var resImage = await uploadImage(
                              source: ImageSource.gallery, context: context);
                        }
                      },
                      child: const SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.image,
                                size: 30,
                              ),
                            ),
                            MyTextWidget(
                              text: "Gallery",
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          var res = await Permission.photos.request();
                          if (res == PermissionStatus.granted) {
                            await uploadImage(
                                source: ImageSource.camera, context: context);
                          } else {
                            var resImage = await uploadImage(
                                source: ImageSource.camera, context: context);
                            if (resImage != null) {}
                          }
                        },
                        child: const SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 30,
                                ),
                              ),
                              MyTextWidget(
                                text: "Camera",
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
