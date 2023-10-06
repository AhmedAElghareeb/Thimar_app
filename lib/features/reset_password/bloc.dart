import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/views/auth/login.dart';
import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';
import 'events.dart';
import 'states.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvents, ResetPasswordStates> {
  ResetPasswordBloc()
      : super(
          ResetPasswordStates(),
        ) {
    on<UserResetPasswordEvent>(resetPassword);
  }

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  void resetPassword(
      UserResetPasswordEvent event, Emitter<ResetPasswordStates> emit) async {
    emit(
      ResetPasswordLoadingState(),
    );
    final response = await DioHelper().sendToServer(
      url: "reset_password",
      body: {
        "phone": event.phone,
        "code": event.pinCode,
        "password": passwordController.text,
        "password_confirmation": confirmPasswordController.text,
      },
    );
    if (response.success) {
      showSnackBar(
        response.msg,
        typ: MessageType.success,
      );
      navigateTo(
        const LoginScreen(),
      );
      emit(
        ResetPasswordSuccessState(),
      );
      passwordController.clear();
      confirmPasswordController.clear();
    } else {
      showSnackBar(
        response.msg,
      );
      emit(
        ResetPasswordFailedState(),
      );
    }
  }
}
