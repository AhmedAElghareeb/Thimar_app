import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/views/main/home/home/view.dart';

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

  final phoneNumberController = TextEditingController();

  final passwordController = TextEditingController();

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
      print( '-=-=--==-=--=- ${response.response!.data['data']['user_cart_count'] }');
      setCartCount(response.response!.data['data']['user_cart_count'] ?? 0);
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
