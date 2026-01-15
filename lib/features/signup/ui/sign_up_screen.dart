import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project_omar_ahmed/core/helpers/spacing.dart';
import 'package:flutter_complete_project_omar_ahmed/core/themeing/styles.dart';
import 'package:flutter_complete_project_omar_ahmed/core/widgets/app_text_button.dart';
import 'package:flutter_complete_project_omar_ahmed/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter_complete_project_omar_ahmed/features/signup/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter_complete_project_omar_ahmed/features/signup/ui/widgets/already_have_an_account.dart';
import 'package:flutter_complete_project_omar_ahmed/features/signup/ui/widgets/sign_up_build_bloc_listner.dart';
import 'package:flutter_complete_project_omar_ahmed/features/signup/ui/widgets/sign_up_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                  Text("Create Account", style: TextStyles.font24BlueBold),
                  verticalSpace(10),
                  Text(
                    'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                    style: TextStyles.font14GreyRegular,
                  ),
                  verticalSpace(36),
                  Column(
                    children: [
                      const SignUpForm(),
                      verticalSpace(40),
                      AppTextButton(
                        buttonText: "Create Account",
                        textStyle: TextStyles.font16WhiteSemiBold,
                        onPressed: () {
                          validateThenDoSignUp(context);
                        },
                      ),
                      verticalSpace(16),
                      const TermsAndConditionsText(),
                      verticalSpace(60),
                      const AlreadyHaveAnAccount(),
                      const SignUpBuildBlocListner(),
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

  void validateThenDoSignUp(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignUpStates();
    }
  }
}
