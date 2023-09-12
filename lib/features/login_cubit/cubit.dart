import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/main/home/home_view/view/home.dart';

part 'states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginStates());

  final phoneNumberController = TextEditingController();

  final passwordController = TextEditingController();

  void userLogin() async {
    emit(LoginLoadingState());
    final response = await DioHelper().sendData(
      "login",
      data: {
        "phone": phoneNumberController.text,
        "password": passwordController.text,
        "type": Platform.operatingSystem,
        "device_token": "test",
        "user_type": "client",
      },
    );
    if (response.isSuccess) {
      showSnackBar(response.message, typ: MessageType.success);
      // var model = LoginModel.fromJson(response.data);
      // final pref = await SharedPreferences.getInstance();
      // pref.setString("token", model.data.token);
      // pref.setString("name", model.data.fullname);
      // pref.setString("phone", model.data.phone);
      // pref.setString("image", model.data.image);
      // navigateTo(
      //   HomeScreen(),
      // );
      emit(
        LoginSuccessState(),
      );
    } else {
      showSnackBar(response.message);
      emit(
        LoginFailedState(msg: response.message ?? ""),
      );
    }
  }
}
