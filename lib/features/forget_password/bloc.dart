import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';
import '../../views/auth/confirm_code.dart';
import 'events.dart';
import 'states.dart';

class ForgetPasswordBloc extends Bloc<ForgetPasswordEvents, ForgetPasswordStates>{
  ForgetPasswordBloc() : super(ForgetPasswordStates(),){
    on<UserForgetPasswordEvent>(forgetPassword);
  }

  final phoneNumberController = TextEditingController();

  void forgetPassword(UserForgetPasswordEvent event, Emitter<ForgetPasswordStates> emit) async {
    emit(ForgetPasswordLoadingState(),);
    final response = await DioHelper().sendToServer(
      url: "forget_password",
      body: {
        "phone": phoneNumberController.text,
      },
    );
    if (response.success) {
      showSnackBar(response.msg, typ: MessageType.success);
      navigateTo(
        ConfirmCode(
          isActive: false,
          phone: phoneNumberController.text,
          pinCode: "1111",
        ),
      );
      emit(ForgetPasswordSuccessState(),);
    } else {
      showSnackBar(response.msg);
      emit(ForgetPasswordFailedState(),);
    }
  }
}