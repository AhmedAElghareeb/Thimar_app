import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';
import '../../views/auth/create_new_password.dart';
import '../../views/auth/login.dart';
import 'events.dart';
import 'states.dart';

class ConfirmCodeBloc extends Bloc<VerifyUserEvents, ConfirmCodeStates> {
  ConfirmCodeBloc()
      : super(
          ConfirmCodeStates(),
        ) {
    on<VerifyCodeEvent>(verify);
    on<ResendCodeEvent>(resend);
  }

  bool isPasswordHidden = true;
  bool isTimerFinished = false;

  final pinCodeController = TextEditingController();

  Future<void> resend(
      ResendCodeEvent event, Emitter<ConfirmCodeStates> emit) async {
    final data = await DioHelper().sendToServer(
      url: "resend_code",
      body: {
        "phone": event.phone,
      },
    );
    if(data.success){
      showSnackBar(
        data.msg,
        typ: MessageType.success,
      );
    } else {
      showSnackBar(
        data.msg,
      );
    }
  }

  void verify(VerifyCodeEvent event, Emitter<ConfirmCodeStates> emit) async {
    emit(
      ConfirmCodeLoadingState(),
    );
    if (event.isActive) {
      await DioHelper().sendToServer(
        url: "check_code",
        body: {
          "phone": event.phone,
          "code" : event.pinCode,
        },
      );
    }
    final response = await DioHelper().sendToServer(
      url: "verify",
      body: {
        "code": pinCodeController.text,
        "phone": event.phone,
        "device_token": FirebaseMessaging.instance.getToken(),
        "type": Platform.operatingSystem,
      },
    );
    if (response.success) {
      showSnackBar(
        response.msg,
        typ: MessageType.success,
      );
      if (event.isActive) {
        navigateTo(
          const LoginScreen(),
        );
      } else {
        navigateTo(
          CreateNewPassword(
            phone: event.phone,
            pinCode: pinCodeController.text,
          ),
        );
      }
      emit(
        ConfirmCodeSuccessState(),
      );
    } else {
      showSnackBar(
        response.msg,
      );
      emit(
        ConfirmCodeFailedState(),
      );
    }
  }
}
