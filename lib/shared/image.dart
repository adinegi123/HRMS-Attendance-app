import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../components/custom_popup.dart';
import '../providers/image_provider.dart';

class ImageSelect extends StatelessWidget {
  const ImageSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ImagePickerProvider>(
        builder: (context, value, child) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
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
                        //border: Border.all(color: kOutlineColor),
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
                        //color: kOutlineColor,
                      )
                          : null,
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () {
                          CustomPopup.showImagePickerPopup(context: context);
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );});
  }
}
