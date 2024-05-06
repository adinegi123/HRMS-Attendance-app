import 'package:attendance_app/class/constant.dart';
import 'package:flutter/material.dart';

class KCustomButton extends StatelessWidget {
  const KCustomButton({
    super.key,
    required this.buttonText,
    this.onTap,
    this.gradient,
    this.isOutline = false,
    this.textStyle,
    this.iconChild,
  });

  final String buttonText;
  final TextStyle? textStyle;
  final Widget? iconChild;
  final LinearGradient? gradient;
  final void Function()? onTap;
  final bool isOutline;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isOutline
              ? null
              : gradient == null
                  ? ColorConst.appPurpleColor
                  : null,
          borderRadius: BorderRadius.circular(8),
          border:
              isOutline ? Border.all(color: ColorConst.appPurpleColor) : null,
          gradient: gradient,
          boxShadow: isOutline
              ? null
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8.0,
                    offset: const Offset(0, 4),
                  )
                ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: iconChild == null
                ? Text(
                    buttonText,
                    style: textStyle ??
                        const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        buttonText,
                        style: textStyle ??
                            const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      iconChild!
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
// Haptic feedback -> vibration -> light impact / selection
// Loader -> api call
// create/ delete -> scaffold Messenger
// Creation screen -> pop
