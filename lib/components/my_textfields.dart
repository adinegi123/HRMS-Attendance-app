import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final TextEditingController controller;
  final IconData prefixIcon;

  const MyTextField({super.key,
    required this.hintText,
    required this.obsecureText,
    required this.controller,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        obscureText: obsecureText,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon, color: Colors.grey.shade400,),

          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none
          ),

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.deepPurple.shade200)
          ),

          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey.shade500
          ),
        ),
      ),
    );
  }
}
