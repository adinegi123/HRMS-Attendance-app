import 'package:attendance_app/class/constant.dart';
import 'package:attendance_app/components/responsive_progress_indicator.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorPopup extends StatelessWidget {
  const ProgressIndicatorPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
            height: 230,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: ResponsiveProgressIndicator(
                  color: ColorConst.appPurpleColor,
                )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Hold on...",
                  style: TextStyle(fontSize: 16),
                )
              ],
            )));
  }
}
