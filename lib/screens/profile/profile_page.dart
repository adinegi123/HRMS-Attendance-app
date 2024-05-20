import 'dart:developer';
import 'dart:io';
import 'package:attendance_app/components/custom_popup.dart';
import 'package:attendance_app/providers/image_provider.dart';
import 'package:attendance_app/shared/image_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/custom_text_widget.dart';
import '../../components/my_textfields.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController employeeName = TextEditingController();
  final TextEditingController employeeId = TextEditingController();
  final TextEditingController DOB = TextEditingController();
  final TextEditingController designation = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  //late File? image;

  @override
  void dispose() {
    employeeName.dispose();
    employeeId.dispose();
    DOB.dispose();
    designation.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ImagePickerProvider>(builder: (context, value, child) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            /*Consumer<ImagePickerProvider>(
              builder: (context, value, child) {*/
            Center(
              child: Stack(
                children: [
                  const SizedBox(
                    width: 105,
                    height: 105,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: (value.profileImageFile != null)
                          ? DecorationImage(
                              image: FileImage(
                                File(value.profileImageFile!.path),
                              ),
                              fit: BoxFit.cover,
                            )
                          : null,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: -2,
                          blurRadius: 20.0,
                          blurStyle: BlurStyle.inner,
                        ),
                      ],
                    ),
                    child: (value.profileImageFile == null)
                        ? const Icon(
                            Icons.person,
                            size: 60,
                          )
                        : null,
                  ),
                  Positioned(
                    bottom: 5,
                    right: 3,
                    child: GestureDetector(
                      onTap: () {
                        try {
                          log("error");
                          log("error in");
                         CustomPopup.showImagePickerPopup(context: context);
                        } catch (e) {
                          log("Error selecting image: $e");
                          // Handle error gracefully, e.g., show a snackbar
                        }
                        //showImagePicker(context);
                        //CustomPopup.showImagePickerPopup(context: context);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.add)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const MyTextWidget(text: "Name"),
            MyTextField(hintText: "Employee Name", controller: employeeName),
            const MyTextWidget(text: "Employee Id"),
            MyTextField(hintText: "Employee Id", controller: employeeId),
            const MyTextWidget(text: "Date Of Birth"),
            MyTextField(hintText: "Enter Your DOB", controller: DOB,
              suffixIcon: GestureDetector(
                onTap: ()=> CustomPopup.showDatePicker(
                  context: context, DOB: DOB),
                child: const Icon(Icons.calendar_month),
              ),
            ),
            const MyTextWidget(text: "Designation"),
            MyTextField(
                hintText: "Enter Your Designation", controller: designation),
            const MyTextWidget(text: "Address"),
            MyTextField(
                hintText: "Enter Address", controller: addressController)
          ],
        ),
      );
    });
  }
}
