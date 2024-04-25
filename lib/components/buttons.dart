import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final void Function()? onTap;
  final Widget? buttonText;
  final double? width;

  const Buttons({
    super.key,
    required this.onTap,
    required this.buttonText, this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width?? MediaQuery.of(context).size.width-80,
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade300,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(15),
        child: buttonText,
      ),
    );
  }
}
