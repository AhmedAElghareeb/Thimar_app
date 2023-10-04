import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/login/states.dart';
import 'package:thimar_app/views/main/view.dart';

import '../../models/login.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginStates());

  final phoneNumberController = TextEditingController(text: "966123456789009");

  final passwordController = TextEditingController(text: "123456789");

  void userLogin() async {
    emit(
      LoginLoadingState(),
    );
    final response = await DioHelper().sendToServer(
      url: "login",
      body: {
        "phone": phoneNumberController.text,
        "password": passwordController.text,
        "type": Platform.operatingSystem,
        "device_token": FirebaseMessaging.instance.getToken(),
        "user_type": "client",
      },
    );
    if (response.success) {
      await CacheHelper.saveLoginData(UserModel.fromJson(response.response!.data['data']));
      showSnackBar(
        response.msg,
        typ: MessageType.success,
      );
      navigateTo(
        const HomeView(),
      );
      emit(
        LoginSuccessState(),
      );
    } else {
      showSnackBar(
        response.msg,
      );
      emit(
        LoginFailedState(),
      );
    }
  }
}