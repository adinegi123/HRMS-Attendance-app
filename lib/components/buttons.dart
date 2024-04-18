import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  Buttons({
    super.key,
    required this.onTap,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width-80,
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade300,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(25),
        child: child,
      ),
    );
  }
}
