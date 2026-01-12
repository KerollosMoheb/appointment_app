import 'package:flutter/material.dart';
import 'package:flutter_complete_project_omar_ahmed/core/helpers/spacing.dart';
import 'package:flutter_complete_project_omar_ahmed/core/themeing/colors.dart';
import 'package:flutter_complete_project_omar_ahmed/core/themeing/styles.dart';
import 'package:flutter_complete_project_omar_ahmed/core/widgets/app_text_button.dart';
import 'package:flutter_complete_project_omar_ahmed/core/widgets/app_text_form_field.dart';
import 'package:flutter_complete_project_omar_ahmed/features/login/ui/widgets/already_have_an_account_text.dart';
import 'package:flutter_complete_project_omar_ahmed/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Back", style: TextStyles.font24BlueBold),
                  verticalSpace(10),
                  Text(
                    'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                    style: TextStyles.font14GreyRegular,
                  ),
                  verticalSpace(36),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        AppTextFormField(hintText: 'Email'),
                        verticalSpace(18),
                        AppTextFormField(
                          hintText: 'Password',
                          isObscureText: isObscureText,
                          suffixIcon: IconButton(
                            onPressed: () =>
                                setState(() => isObscureText = !isObscureText),
                            icon: Icon(
                              isObscureText
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: ColorsManager.lightGrey,
                            ),
                            color: ColorsManager.lightGrey,
                          ),
                        ),
                        verticalSpace(24),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text(
                            'Forgot Password?',
                            style: TextStyles.font13BlueRegular,
                          ),
                        ),
                        verticalSpace(40),
                        AppTextButton(
                          buttonText: "Login",
                          textStyle: TextStyles.font16WhiteSemiBold,
                          onPressed: () {},
                        ),
                        verticalSpace(16),
                        const TermsAndConditionsText(),
                        verticalSpace(60),
                        const AlreadyHaveAnAccountText(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
