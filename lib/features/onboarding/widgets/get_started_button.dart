import 'package:flutter/material.dart';
import 'package:flutter_complete_project_omar_ahmed/core/helpers/extensions.dart';
import 'package:flutter_complete_project_omar_ahmed/core/routing/routes.dart';
import 'package:flutter_complete_project_omar_ahmed/core/themeing/colors.dart';
import 'package:flutter_complete_project_omar_ahmed/core/themeing/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      style: TextButton.styleFrom(
        backgroundColor: ColorsManager.mainBlue,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(double.infinity, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Text('Get Started', style: TextStyles.font16WhiteSemiBold),
    );
  }
}
