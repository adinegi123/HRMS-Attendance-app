import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveProgressIndicator extends StatelessWidget {
  const ResponsiveProgressIndicator({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return CircularProgressIndicator(
        color: color ?? Colors.grey,
      );
    } else {
      return CupertinoActivityIndicator(
        radius: 16,
        color: color ?? Colors.grey,
      );
    }
  }
}
