import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project_omar_ahmed/core/helpers/spacing.dart';
import 'package:flutter_complete_project_omar_ahmed/core/themeing/styles.dart';
import 'package:flutter_complete_project_omar_ahmed/core/widgets/app_text_button.dart';
import 'package:flutter_complete_project_omar_ahmed/features/login/logic/login_cubit/login_cubit.dart';
import 'package:flutter_complete_project_omar_ahmed/features/login/ui/widgets/dont_have_an_account_text.dart';
import 'package:flutter_complete_project_omar_ahmed/features/login/ui/widgets/email_and_password.dart';
import 'package:flutter_complete_project_omar_ahmed/features/login/ui/widgets/login_build_bloc_listner.dart';
import 'package:flutter_complete_project_omar_ahmed/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  Column(
                    children: [
                      const EmailAndPassword(),
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
                        onPressed: () {
                          validateThenDoLogin(context);
                        },
                      ),
                      verticalSpace(16),
                      const TermsAndConditionsText(),
                      verticalSpace(60),
                      const DontHaveAnAccountText(),
                      const LoginBuildBlocListner(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
