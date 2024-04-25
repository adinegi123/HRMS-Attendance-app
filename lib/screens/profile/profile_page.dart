import 'dart:io';
import 'package:attendance_app/components/custom_popup.dart';
import 'package:attendance_app/providers/image_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../class/constant.dart';
import '../../components/custom_text_widget.dart';
import '../../components/my_textfields.dart';
import 'package:image_picker/image_picker.dart';


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
  late File? image;

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
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Consumer<ImagePickerProvider>(
              builder: (context, value, child) {
            return Stack(
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person_outline, size: 70,),
                  ),
                ),
                Positioned(
                  right: 145,
                    bottom: 1,
                    child:CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.black54,
                      child: IconButton(onPressed: (){
                        CustomPopup.showImagePickerPopup(context: context);
                      }, icon: const Icon(Icons.add_a_photo,size: 20,),color: Colors.white,),
                    ))
              ],
            );}),
            const SizedBox(height: 20,),
            const MyTextWidget(text: "Name"),
            MyTextField(
                hintText: "Employee Name",
                controller: employeeName),
            const MyTextWidget(text: "Employee Id"),
            MyTextField(
                hintText: "Employee Id",
                controller: employeeId),
            const MyTextWidget(text: "Date Of Birth"),
            MyTextField(
                hintText: "Enter Your DOB",
                controller: DOB),
            const MyTextWidget(text: "Designation"),
            MyTextField(
                hintText: "Enter Your Designation",
                controller: designation),
            const MyTextWidget(text: "Address"),
            MyTextField(
                hintText: "Enter Address",
                controller: addressController)
          ],
        ),
      ),
    );
  }
}