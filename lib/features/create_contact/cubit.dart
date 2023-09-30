import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/features/create_contact/states.dart';

import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';

class CreateContactCubit extends Cubit<CreateContactStates> {
  CreateContactCubit() : super(CreateContactStates(),);

  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final subjectController = TextEditingController();

  void sendContact() async {
    emit(
      SendContactLoadingState(),
    );
    final result = await DioHelper().sendToServer(
      url: "contact",
      body: {
        "fullname": nameController.text,
        "phone": phoneNumberController.text,
        "content": subjectController.text,
      },
    );
    if (result.success) {
      showSnackBar(
        result.msg,
        typ: MessageType.success,
      );
      nameController.clear();
      phoneNumberController.clear();
      subjectController.clear();
      emit(
        SendContactSuccessState(),
      );
    } else {
      emit(
        SendContactFailedState(),
      );
    }
  }

}