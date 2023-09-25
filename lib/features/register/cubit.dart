import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/register/states.dart';
import 'package:thimar_app/models/cities.dart';
import 'package:thimar_app/views/auth/verify_code.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterStates());

  CityModel? selectedCity;

  final nameController = TextEditingController();

  final phoneNumberController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  void userRegister() async {
    emit(
      RegisterLoadingState(),
    );
    final response = await DioHelper().sendToServer(
      url: "client_register",
      body: {
        "fullname": nameController.text,
        "phone": phoneNumberController.text,
        "password": passwordController.text,
        "password_confirmation": confirmPasswordController.text,
        "country_id": 1,
        "city_id": selectedCity!.id,
      },
    );
    if (response.success) {
      showSnackBar(
        response.msg,
        typ: MessageType.success,
      );
      navigateTo(
        VerifyCode(
          isActive: true,
          phone: phoneNumberController.text,
        ),
      );
      emit(
        RegisterSuccessState(),
      );
    } else {
      showSnackBar(
        response.msg,
      );
      emit(
        RegisterFailedState(),
      );
    }
  }
}
