import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';
import '../../models/cities.dart';
import '../../views/auth/confirm_code.dart';
import 'states.dart';
import 'events.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterStates>{
  RegisterBloc() : super(RegisterStates(),){
    on<RegisterUserDataEvent>(userRegister);
  }

  CityModel? selectedCity;

  final nameController = TextEditingController();

  final phoneNumberController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  void userRegister(RegisterUserDataEvent event, Emitter<RegisterStates> emit) async {
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
        ConfirmCode(
          isActive: true,
          phone: phoneNumberController.text,
          pinCode: "1111",
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