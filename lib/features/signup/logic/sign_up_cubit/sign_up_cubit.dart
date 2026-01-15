import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project_omar_ahmed/core/networking/api_result.dart';
import 'package:flutter_complete_project_omar_ahmed/features/signup/data/models/sign_up_request_body.dart';
import 'package:flutter_complete_project_omar_ahmed/features/signup/data/repos/sign_up_repo.dart';
import 'package:flutter_complete_project_omar_ahmed/features/signup/logic/sign_up_cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signUpRepo) : super(SignUpState.initial());
  final SignUpRepo _signUpRepo;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> emitSignUpStates() async {
    emit(SignUpState.signupLoading());
    final response = await _signUpRepo.signUp(
      SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0,
      ),
    );
    response.when(
      success: (signUpResponse) {
        emit(SignUpState.signupSuccess(signUpResponse));
      },
      failure: (error) {
        emit(SignUpState.signupError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
