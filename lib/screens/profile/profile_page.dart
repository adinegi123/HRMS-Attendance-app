import 'dart:io';
import 'package:attendance_app/components/custom_text_widget.dart';
import 'package:attendance_app/components/text_widget.dart';

import 'package:attendance_app/models/user_model.dart';
import 'package:attendance_app/providers/image_provider.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../components/my_textfields.dart';
import '../../shared/image.dart';

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

    String currentdate = DateFormat('dd MMM yyyy').format(DateTime.now());

    return Consumer<ImagePickerProvider>(builder: (context, value, child) {
      return Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              color: Colors.white60
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const ImageSelect(),
                  const SizedBox(height: 5),
                  const TextWidget(
                    text: 'EMPLOYEE NAME',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  //SizedBox(height: 20),
                  const TextWidget(
                    text: 'Lat = 32.7336573 | Long = 74.821',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent.shade100,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        Text(
                          currentdate,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Column(
                              children: [
                                Text(
                                  'In Time',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '9:01',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 1,
                              height: 30,
                              color: Colors.white,
                            ),
                            const Column(
                              children: [
                                Text(
                                  'Out Time',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '3:01',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple.shade600,
                          ),
                          child: const Text('Attendance Completed', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white
                          ),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          SingleChildScrollView(
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyTextWidget(text: "Profile Information :"),
                //MyTextField(hintText: "hintText")
                MyTextField(
                  hintText: "Employee Name",
                  controller: employeeName,
                  readOnly: true,
                  prefixIcon: const Icon(Icons.person),
                ),
                // const MyTextWidget(text: "Employee Id"),
                MyTextField(
                  hintText: "Employee Id",
                  controller: employeeId,
                  readOnly: true,
                  prefixIcon: const Icon(Icons.perm_contact_cal_outlined),
                ),
                // const MyTextWidget(text: "Date Of Birth"),
                MyTextField(
                  hintText: "Date of Birth", controller: DOB, readOnly: true,
                  prefixIcon: const Icon(Icons.date_range_rounded), //To be implemented yet
                ),

                MyTextField(
                  hintText: "Your Age",
                  controller: age,
                  readOnly: true,
                  prefixIcon: const Icon(Icons.perm_contact_calendar),
                ),
                // const MyTextWidget(text: "Designation"),
                MyTextField(
                  hintText: " Your Designation",
                  controller: designation,
                  readOnly: true,
                  prefixIcon: const Icon(Icons.description),
                ),
                // const MyTextWidget(text: "Address"),
                MyTextField(
                  hintText: "Your Address",
                  controller: addressController,
                  readOnly: true,
                  prefixIcon: const Icon(Icons.location_on),
                ),
              ],
            ),
          )
        ],
      );

      /*return SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 20,
        ),

                //Profile image set
                const ImageSelect(),

        *//*Consumer<ImagePickerProvider>(
            builder: (context, value, child) {*//*

        *//*Consumer<ImagePickerProvider>(
                          builder: (context, value, child) {*//*
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
      ]));*/
    });
  }
}
