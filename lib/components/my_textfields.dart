import 'package:flutter/material.dart';

import '../class/constant.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool? obscureText;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

   const MyTextField({super.key,
    required this.hintText,
    this.obscureText,
    required this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15,bottom: 10),
      child: TextFormField(
        obscureText: obscureText??false,
        controller: controller,
        validator: validator,
        keyboardType:keyboardType,
        decoration: InputDecoration(
          prefixIcon:prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none
          ),

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: borderSide)
          ),

          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey.shade500
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16,horizontal: 15),
        ),
      ),
    );
  }
}
