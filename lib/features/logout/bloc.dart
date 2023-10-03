import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/cache_helper.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/logout/events.dart';
import 'package:thimar_app/features/logout/states.dart';

class LogoutBloc extends Bloc<LogoutEvents, LogoutStates> {
  LogoutBloc()
      : super(
          LogoutStates(),
        ) {
    on<SendLogout>(logout);
  }

  Future<void> logout(SendLogout event, Emitter<LogoutStates> emit) async {
    emit(
      LogoutLoadingState(),
    );
    print("ahmed : ${CacheHelper.getToken()}");

    final response = await DioHelper().sendToServer(
      url: "logout",
      body: {
        "device_token": FirebaseMessaging.instance.getToken(),
        "type": Platform.operatingSystem,
      },
    );

    if (response.success) {
      CacheHelper.removeLoginData();
      emit(
        LogoutSuccessState(),
      );
      showSnackBar(
        response.msg,
        typ: MessageType.success,
      );
    } else {
      emit(
        LogoutFailedState(),
      );
    }
  }
}
