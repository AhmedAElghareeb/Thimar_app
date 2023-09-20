import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/login_cubit/states.dart';
import 'package:thimar_app/views/main/home/home/view.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginStates());

  final phoneNumberController = TextEditingController();

  final passwordController = TextEditingController();

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
        "device_token": "test",
        "user_type": "client",
      },
    );
    if (response.success) {
      CacheHelper.saveLoginData(response.response!.data);
      showSnackBar(
        response.msg,
        typ: MessageType.success,
      );
      navigateTo(
        HomeScreen(),
      );
      emit(
        LoginSuccessState(),
      );
    } else {
      showSnackBar(response.msg);
      emit(
        LoginFailedState(),
      );
    }
  }
}
