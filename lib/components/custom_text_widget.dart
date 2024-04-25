import 'package:flutter/material.dart';

class CustomTextStyles {
  static const TextStyle defaultTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}

class MyTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const MyTextWidget({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
      child: Text(
        text,
        style: style ?? CustomTextStyles.defaultTextStyle,
      ),
    );
  }
}

