import 'package:flutter/material.dart';

class CustomTextStyle {
  static const TextStyle defaultTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.normal,
  );
}

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const TextWidget({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
      child: Text(
        text,
        style: style ?? CustomTextStyle.defaultTextStyle,
      ),
    );
  }
}

