import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/confirm_code/states.dart';

import '../../core/logic/dio_helper.dart';
import '../../views/auth/create_new_password.dart';
import '../../views/auth/login.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeStates> {
  VerifyCodeCubit()
      : super(
          VerifyCodeStates(),
        );

  bool isPasswordHidden = true;
  bool isTimerFinished = false;

  final pinCodeController = TextEditingController();

  Future<void> resend({required String phone}) async {
    await DioHelper().sendToServer(
      url: "resend_code",
      body: {
        "phone": phone,
      },
    );
  }

  void verify({required bool isActive, required String phone}) async {
    emit(
      VerifyCodeLoadingState(),
    );
    if (isActive) {
      await DioHelper().sendToServer(
        url: "resend_code",
        body: {
          "phone": phone,
        },
      );
    }
    final response = await DioHelper().sendToServer(
      url: "verify",
      body: {
        "code": pinCodeController.text,
        "phone": phone,
        "device_token": "test",
        "type": Platform.operatingSystem,
      },
    );
    if (response.success) {
      showSnackBar(response.msg, typ: MessageType.success);
      if (isActive) {
        navigateTo(
          const LoginScreen(),
        );
      } else {
        navigateTo(
          CreateNewPassword(
            phone: phone,
            pinCode: pinCodeController.text,
          ),
        );
      }
      emit(
        VerifyCodeSuccessState(),
      );
    } else {
      showSnackBar(response.msg);
      emit(
        VerifyCodeFailedState(),
      );
    }
  }
}
