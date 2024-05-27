import 'package:attendance_app/class/constant.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String leaveType;
  final String dateRange;
  final String status;
  final String reason;
  final Color statusColor;

  const CustomContainer({
    super.key,
    required this.leaveType,
    required this.dateRange,
    required this.status,
    required this.reason,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 5 - 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(color: ColorConst.AccentColor, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                leaveType,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(dateRange),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: statusColor,
                      ),
                      child: Text(
                        status,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Text(reason),
            ],
          ),
        ),
      ),
    );
  }
}
