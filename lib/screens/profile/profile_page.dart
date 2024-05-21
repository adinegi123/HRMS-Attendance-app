import 'dart:developer';
import 'dart:io';
import 'package:attendance_app/Firebase%20methods/firebase_methods.dart';
import 'package:attendance_app/Local%20Database/local_database.dart';
import 'package:attendance_app/components/custom_popup.dart';

import 'package:attendance_app/models/user_model.dart';
import 'package:attendance_app/providers/image_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final TextEditingController age = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  late File? image;
  late UserDataModel? userData;

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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 20,
        ),
        /*Consumer<ImagePickerProvider>(
            builder: (context, value, child) {*/

        /*Consumer<ImagePickerProvider>(
                          builder: (context, value, child) {*/
        const SizedBox(
          height: 20,
        ),
        // const MyTextWidget(text: "Name"),
        MyTextField(
          hintText: "Employee Name",
          controller: employeeName,
          readOnly: true,
        ),
        // const MyTextWidget(text: "Employee Id"),
        MyTextField(
          hintText: "Employee Id",
          controller: employeeId,
          readOnly: true,
        ),
        // const MyTextWidget(text: "Date Of Birth"),
        MyTextField(
          hintText: "Date of Birth", controller: DOB, readOnly: true,
          suffixIcon: Icon(Icons.calendar_month), //To be implemented yet
        ),

        MyTextField(
          hintText: "Your Age",
          controller: age,
          readOnly: true,
        ),
        // const MyTextWidget(text: "Designation"),
        MyTextField(
          hintText: " Your Designation",
          controller: designation,
          readOnly: true,
        ),
        // const MyTextWidget(text: "Address"),
        MyTextField(
          hintText: "Your Address",
          controller: addressController,
          readOnly: true,
        ),
        const SizedBox(
          height: 20,
        ),
        const MyTextField(hintText: "Name"),
        MyTextField(hintText: "Employee Name", controller: employeeName),
        const MyTextField(hintText: "Employee Id"),
        MyTextField(hintText: "Employee Id", controller: employeeId),
        const MyTextField(hintText: "Date Of Birth"),
        MyTextField(
          hintText: "Enter Your DOB",
          controller: DOB,
          suffixIcon: GestureDetector(
            onTap: () => CustomPopup.showDatePicker(context: context, DOB: DOB),
            child: const Icon(Icons.calendar_month),
          ),
        ),
        const MyTextField(hintText: "Designation"),
        MyTextField(
            hintText: "Enter Your Designation", controller: designation),
        const MyTextField(hintText: "Address"),
        MyTextField(hintText: "Enter Address", controller: addressController)
      ]));
    });
  }
}
