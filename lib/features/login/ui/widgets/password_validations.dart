import 'package:flutter/material.dart';
import 'package:flutter_complete_project_omar_ahmed/core/helpers/spacing.dart';
import 'package:flutter_complete_project_omar_ahmed/core/themeing/colors.dart';
import 'package:flutter_complete_project_omar_ahmed/core/themeing/styles.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations({
    super.key,
    required this.hasUpperCase,
    required this.hasLowerCase,
    required this.hasNumber,
    required this.hasSpecialCharacter,
    required this.hasMinLength,
  });
  final bool hasUpperCase;
  final bool hasLowerCase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationsRow('At Least 1 lowercase letter', hasLowerCase),
        verticalSpace(2),
        buildValidationsRow('At Least 1 uppercase letter', hasUpperCase),
        verticalSpace(2),
        buildValidationsRow(
          'At Least 1 special character',
          hasSpecialCharacter,
        ),
        verticalSpace(2),
        buildValidationsRow('At Least 1 number', hasNumber),
        verticalSpace(2),
        buildValidationsRow('At Least 8 characters', hasMinLength),
      ],
    );
  }

  Widget buildValidationsRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(radius: 2.5, backgroundColor: ColorsManager.grey),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font13DarkBlueRedular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationThickness: 2,
            color: hasValidated
                ? ColorsManager.lightGrey
                : ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
