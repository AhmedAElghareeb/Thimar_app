import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';
import '../../models/contact_us.dart';
import 'events.dart';
import 'states.dart';

class ContactUsBloc extends Bloc<GetContactEvents, ContactUsStates>{
  ContactUsBloc() : super(ContactUsStates(),){
    on<SendContactDataEvent>(sendContact);
    on<GetContactDataEvent>(getContact);
  }

  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final subjectController = TextEditingController();

  void sendContact(SendContactDataEvent event, Emitter<ContactUsStates> emit)
  async {
    emit(
      SendContactLoadingState(),
    );
    final response = await DioHelper().sendToServer(
      url: "contact",
      body: {
        "fullname": nameController.text,
        "phone": phoneNumberController.text,
        "content": subjectController.text,
      },
    );
    if (response.success) {
      showSnackBar(
        response.msg,
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

  void getContact(GetContactDataEvent event, Emitter<ContactUsStates> emit)
  async {
    emit(
      GetContactLoadingState(),
    );

    final response = await DioHelper().getFromServer(
      url: "contact",
    );
    if (response.success) {
      final model = ContactModel.fromJson(response.response!.data["data"]);
      emit(
        GetContactSuccessState(model: model),
      );
    } else {
      emit(
        GetContactFailedState(),
      );
    }
  }

}