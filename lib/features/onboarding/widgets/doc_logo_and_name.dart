import 'package:flutter/material.dart';
import 'package:flutter_complete_project_omar_ahmed/core/themeing/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svgs/docdoc_logo.svg'),
        SizedBox(width: 10.w),
        Text("DocDoc", style: TextStyles.font24Black700Weight),
      ],
    );
  }
}
