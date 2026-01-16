import 'package:flutter/material.dart';
import 'package:flutter_complete_project_omar_ahmed/core/themeing/colors.dart';
import 'package:flutter_complete_project_omar_ahmed/core/themeing/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.isObscureText,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.contentPadding,
    this.backgroundColor,
    this.controller,
    required this.validator,
  });
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      decoration: InputDecoration(
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(vertical: 20.w, horizontal: 18.h),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(color: ColorsManager.mainBlue, width: 1.3),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(
                color: ColorsManager.lighterGrey,
                width: 1.3,
              ),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: Colors.red, width: 1.3),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: Colors.red, width: 1.3),
        ),
        hintStyle: hintStyle ?? TextStyles.font14LightGreyRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? ColorsManager.morelightGrey,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? TextStyles.font14DarkBlueMedium,
    );
  }
}
