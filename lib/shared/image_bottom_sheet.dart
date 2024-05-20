// import 'package:attendance_app/class/constant.dart';
// import 'package:attendance_app/components/secondary_custom_button.dart';
// import 'package:attendance_app/providers/image_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:provider/provider.dart';
//
//
// class ImagePickerPopup extends StatelessWidget {
//   ImagePickerPopup({super.key, this.text, this.onSaveFunction});
//   final String? text;
//   final void Function()? onSaveFunction;
//   final ImagePicker _imagePicker = ImagePicker();
//   final ImageCropper _imageCropper = ImageCropper();
//
//   Future<String?> uploadImage(
//       {required ImageSource source, required BuildContext context}) async {
//     var resImage = await _imagePicker.pickImage(source: source);
//     if (resImage != null) {
//       var croppedImage = await _imageCropper.cropImage(
//         sourcePath: resImage.path,
//         compressQuality: 70,
//         uiSettings: [
//           AndroidUiSettings(
//               toolbarTitle: 'Image Cropper',
//               toolbarColor: appPurpleColor,
//               toolbarWidgetColor: Colors.white,
//               initAspectRatio: CropAspectRatioPreset.square,
//               lockAspectRatio: false),
//           IOSUiSettings(
//             title: 'Image Cropper',
//           ),
//         ],
//       );
//       // Navigator.pop(context);
//       if (croppedImage != null) {
//         Provider.of<ImagePickerProvider>(context, listen: false).uploadPicture(croppedImage);
//         Navigator.pop(context);
//       }
//     }
//     return null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.white,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(22),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 text ?? 'Upload Image',
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                   color: appPurpleColor,
//                 ),
//               ),
//               Padding(
//                 padding:
//                 const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
//                 child: Column(
//                   children: [
//                     KCustomButton(
//                       onTap: () async {
//                         var res = await Permission.camera.request();
//                         if (res == PermissionStatus.denied ||
//                             res == PermissionStatus.permanentlyDenied ||
//                             res == PermissionStatus.restricted) {
//                           // negative case
//                         } else {
//                           // positive case
//                           // ignore: use_build_context_synchronously
//                           var resImage = await uploadImage(
//                               source: ImageSource.camera, context: context);
//                         }
//                       },
//                       // gradient: Colors.green,
//                       buttonText: 'Take a picture',
//                       iconChild: const Icon(
//                         Icons.camera,
//                         color: Colors.white,
//                       ),
//                       // buttonText: const Row(
//                       //   mainAxisAlignment: MainAxisAlignment.center,
//                       //   children: [
//                       //     Text(
//                       //       'Take a picture',
//                       //       style: TextStyle(
//                       //         color: Colors.white,
//                       //       ),
//                       //     ),
//                       //     SizedBox(width: 10),
//                       // Icon(
//                       //   Icons.camera,
//                       //   color: Colors.white,
//                       // ),
//                       //   ],
//                       // ),
//                     ),
//                     const SizedBox(height: 10),
//                     KCustomButton(
//                       onTap: () async {
//                         var res = await Permission.mediaLibrary.request();
//                         if (res == PermissionStatus.denied ||
//                             res == PermissionStatus.permanentlyDenied ||
//                             res == PermissionStatus.restricted) {
//                           // negative case
//                         } else {
//                           // positive case
//                           // ignore: use_build_context_synchronously
//                           var resImage = await uploadImage(
//                               source: ImageSource.gallery, context: context);
//                           if (resImage != null) {}
//                         }
//                       },
//                       // gradient: kPrimaryGradient,
//                       buttonText: 'Upload from Gallery',
//                       iconChild: const Icon(
//                         Icons.photo_library_rounded,
//                         color: Colors.white,
//                       ),
//                       // buttonText: const Row(
//                       //   mainAxisAlignment: MainAxisAlignment.center,
//                       //   children: [
//                       //     Text(
//                       //       'Upload from Gallery',
//                       //       style: TextStyle(
//                       //         color: Colors.white,
//                       //       ),
//                       //     ),
//                       //     SizedBox(width: 10),
//                       //     Icon(
//                       //       Icons.photo_library_rounded,
//                       //       color: Colors.white,
//                       //     ),
//                       //   ],
//                       // ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
