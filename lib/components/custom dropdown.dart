import 'package:flutter/material.dart';
import '../class/constant.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu(
      {super.key,
        required this.dropdownMenuEntries,
        this.initialSelection,
        this.width,
        this.hintText,
        this.decoration,
        this.contentPadding,
        this.color,
        this.floatingLabelBehavior,
        this.leadingIcon,
        this.label,
        this.trailingIcon,
        this.onSelect,
        this.controller});

  final List<DropdownMenuEntry<Object?>> dropdownMenuEntries;
  final Object? initialSelection;
  final double? width;
  final String? hintText;
  final Color? color;
  final InputDecorationTheme? decoration;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? floatingLabelBehavior;
  final Widget? leadingIcon;
  final Widget? label;
  final Widget? trailingIcon;
  final Function(Object?)? onSelect;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<Object?>(
      dropdownMenuEntries: dropdownMenuEntries,
      initialSelection: initialSelection,
      width: width,
      hintText: hintText,
      controller: controller,
      menuStyle: MenuStyle(
        maximumSize:
        MaterialStateProperty.all(const Size.fromHeight(ColorConst.DropdownHeight)),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        surfaceTintColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            side: BorderSide(color:ColorConst.AccentColor, width: 1),
          ),
        ),
      ),
      leadingIcon: leadingIcon != null
          ? Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Container(
          alignment: Alignment.center,
          width: 20,
          decoration: BoxDecoration(
            color: ColorConst.AccentColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: leadingIcon,
        ),
      )
          : null,
      label: label,
      trailingIcon: trailingIcon,
      onSelected: onSelect,
      inputDecorationTheme: decoration ??
          InputDecorationTheme(
            isDense: true,
            contentPadding: contentPadding ?? const EdgeInsets.all(0),
            border: ColorConst.constPrimaryOutlineBorder,
            errorBorder: ColorConst.constPrimaryOutlineBorder,
            enabledBorder: ColorConst.constPrimaryOutlineBorder,
            focusedBorder: ColorConst.constPrimaryOutlineBorder,
            disabledBorder: ColorConst.constPrimaryOutlineBorder,
            focusedErrorBorder: ColorConst.constPrimaryOutlineBorder,
          ),
    );
  }
}
