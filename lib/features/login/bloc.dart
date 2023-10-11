import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/cache_helper.dart';
import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';
import '../../models/login.dart';
import '../../views/main/view.dart';
import 'events.dart';
import 'states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc()
      : super(
          LoginStates(),
        ) {
    on<LoginUserDataEvent>(userLogin);
  }

  final phoneNumberController = TextEditingController(
    text: "966123456789009",
  );

  final passwordController = TextEditingController(
    text: "123456789",
  );

  void userLogin(LoginUserDataEvent event, Emitter<LoginStates> emit) async {
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
      await CacheHelper.saveLoginData(
          UserModel.fromJson(response.response!.data['data']));
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
