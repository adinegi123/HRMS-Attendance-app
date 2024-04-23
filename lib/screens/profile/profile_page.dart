import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../class/constant.dart';
import '../../components/custom_text_widget.dart';
import '../../components/my_textfields.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController EmployeeName = TextEditingController();
  final TextEditingController EmployeeId = TextEditingController();
  final TextEditingController DOB = TextEditingController();
  final TextEditingController designation = TextEditingController();
  final TextEditingController AddressController = TextEditingController();

  void showImagePicker(BuildContext context){
    showModalBottomSheet(context: context, builder: (builder){
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/7,
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: (){},
                  child: const SizedBox(
                    child: Column(
                      children: [
                        Icon(Icons.image,size: 50,),
                        Text("Gallery")
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: (){},
                  child: const SizedBox(
                    child: Column(
                      children: [
                        Icon(Icons.camera_alt,size: 50,),
                        Text("Camera")
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    );
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
            Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(Images.iconProfileImg),
                  ),
                ),
                Positioned(
                  right: 150,
                    bottom: -7,
                    child:IconButton(onPressed: (){
                      showImagePicker(context);
                    }, icon: const Icon(Icons.add_a_photo),color: Colors.white,))
              ],
            ),
            const SizedBox(height: 20,),
            const MyTextWidget(text: "Name"),
            MyTextField(
                hintText: "Employee Name",
                controller: EmployeeName),
            const MyTextWidget(text: "Employee Id"),
            MyTextField(
                hintText: "Employee Id",
                controller: EmployeeId),
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
                controller: AddressController)
          ],
        ),
      ),
    );
  }
}